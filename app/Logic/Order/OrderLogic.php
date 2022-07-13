<?php


namespace App\Logic\Order;

use App\Logic\Logic;
use App\Models\GoodsSpec;
use App\Models\Order;
use App\Models\OrderRefund;

class OrderLogic extends Logic
{
    /**
     * @param array $where
     * @param int[] $pageData
     * @param array $sortData
     * @return \Illuminate\Http\JsonResponse
     */
    public static function lists($where = [], $pageData = ['pageSize' => 20, 'pageNow' => 1], $sortData = [])
    {
        $data = Order::query()
            ->with('orderGoods')
            ->when(!empty($where['status']), function($query) use($where){
                $query->where('status', $where['status']);
            })
            ->where('order_type', 1)
            ->where('uid', auth('api')->id())
            ->orderBy('order_id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        foreach($data["data"] as &$item){
            $ids = explode(',', implode(',', array_column($item["order_goods"], 'sku')));
            $goodsSpec = GoodsSpec::query()->with('SpecValue')->whereIn('id', array_unique($ids))->get()->toArray();
            $spec_value = array_column($goodsSpec, 'spec_value', 'id');
            foreach($item["order_goods"] as &$val){
                $sku_name = '';
                if (!empty($val["sku"])) {
                    foreach(explode(",", $val["sku"]) as $id){
                        if (isset($spec_value[$id])) {
                            $sku_name .= $spec_value[$id]['spec_value'] . ';';
                        }
                    }
                }
                
                $val['sku_name'] = rtrim($sku_name, ';');
            }
        }

        return lists($data);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function detail($params)
    {
        $data = Order::query()->where('uid', auth('api')->id())->with('orderGoods')->where('order_id', $params['order_id'])->first();
        abort_unless($data, 404, '订单不存在！');
        $order = $data->toArray();
        $ids = explode(',', implode(',', array_column($order["order_goods"], 'sku')));
        $goodsSpec = GoodsSpec::query()->with('SpecValue')->whereIn('id', array_unique($ids))->get()->toArray();
        $spec_value = array_column($goodsSpec, 'spec_value', 'id');
        if ($order['status'] == Order::WAIT_PAID_ORDER) {
            $order['countdown'] = array(
                'hour' => 0,
                'minute' => 30,
                'second' => 0
            );
        }
        foreach($order["order_goods"] as &$val){
            $sku_name = '';
            if (!empty($val["sku"])) {
                foreach(explode(",", $val["sku"]) as $id){
                    if (isset($spec_value[$id])) {
                        $sku_name .= $spec_value[$id]['spec_value'] . ';';
                    }
                }
            }
            
            $val['sku_name'] = rtrim($sku_name, ';');
        }
        return data($order);
    }

    /**
     * 关闭订单
     * 
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function close($params)
    {
        $data = Order::query()->where('uid', auth('api')->id())->where('order_id', $params['order_id'])->first();
        abort_unless($data, 404, '订单不存在！');
        abort_unless($data->status !== 1, 500, '订单状态异常！');
        $result = Order::query()->where('uid', auth('api')->id())->where('order_id', $params['order_id'])->update(["status" => Order::TRADING_CLOSED_ORDER]);
        return $result ? success() : error();
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-06
     * @param  [type] $params
     */
    public static function refund($params)
    {
        $data = Order::query()->where('uid', auth('api')->id())->where('order_id', $params['order_id'])->first();
        abort_unless($data, 404, '订单不存在！');
        abort_unless($data->status > Order::WAIT_PAID_ORDER, 500, '订单状态异常！');
        $refund = OrderRefund::query()->where('uid', auth('api')->id())->where('order_id', $params['order_id'])->first();
        abort_if($refund, 500, '该订单已申请!');

        $data = array(
            'uid' => auth('api')->id(),
            'order_id' => $params['order_id'],
            'order_no' => $data->order_no,
            'remark' => $params['remark'],
        );
        $result = OrderRefund::query()->create($data);
        return $result ? success() : error();
    }

    /**
     * 确认收货
     *
     * @param [type] $params
     */
    public function confirm($params)
    {
        $data = Order::query()->where('uid', auth('api')->id())->where('order_id', $params['order_id'])->first();
        abort_unless($data, 404, '订单不存在！');
        abort_unless($data->status > Order::HAVE_SHIPPED_ORDER, 500, '订单状态异常！');

        $data = array(
            'status' => Order::TRADING_SUCCESS_ORDER,
            'end_time' => date('Y-m-d H:i:s')
        );
        $result = Order::query()->where('uid', auth('api')->id())->where('order_id', $params['order_id'])->update($data);
        return $result ? success() : error();
    }
}
