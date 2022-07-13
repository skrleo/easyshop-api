<?php

namespace App\Logic\Goods;


use App\Logic\Logic;
use App\Models\Address;
use App\Models\BlindBox;
use App\Models\BlindBoxDeal;
use App\Models\BlindBoxOrder;
use App\Models\BlindBoxRule;
use App\Models\Order;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;

class BlindBoxLogic extends Logic
{
    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-09
     * @param  array $where
     * @param  array $pageData
     * @param  array $sortData
     */
    public function lists($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = BlindBox::query()
            ->with(['blindBoxRule'])
            ->where('status', 1)
            ->when(!empty($where['keyword']), function (Builder $query) use ($where) {
                $query->where('name', 'like', '%' . $where['keyword'] . '%');
            })
            ->orderBy('sort', 'desc')
            ->orderBy('id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        foreach ($data['data'] as &$item) {
            $item['thumb'] = Arr::first(array_column(json_decode($item['thumb'], true), 'url'));
        }

        return lists($data);
    }

    /**
     * 盲盒详情
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-09
     * @param  [type] $params
     */
    public function detail($params)
    {
        $box = BlindBox::query()->where('id', $params["id"])->first();
        abort_unless($box, 500, '盲盒不存在');
        $data = $box->toArray();
        $data['blind_box_rule'] = BlindBoxRule::query()->where('blind_box_id', $data['id'])->get();
        $dealType = BlindBoxDeal::query()->where('status', 1)->get()->keyBy('id')->toArray();
        foreach($data['blind_box_rule'] as &$item){
            $item["type_name"] = isset($dealType[$item['rule_type']]) ? $dealType[$item['rule_type']]['title'] : '';
        }
        $data['thumb'] = json_decode($data['thumb'], true);
        $data['type_group'] = array_values($dealType);
        foreach($data['type_group'] as $key => &$val){
            $val['rate'] = $val['virtual_rate'];
            unset($data['type_group'][$key]['reality_rate']);
            unset($data['type_group'][$key]['virtual_rate']);
        }
        return data($data);
    }

    /**
     * 盲盒订单详情
     *
     * @param [type] $params
     * @return void
     */
    public function prize($params)
    {
        $order = BlindBoxOrder::query()->where('order_id', $params['order_id'])->first();
        abort_unless($order, 500, '盲盒订单不存在！');
        $dealType = BlindBoxDeal::query()->where('id', $order->rule_type)->first()->toArray();
        $data = $order->toArray();
        $data['type_name'] = $dealType['title'];
        $address = [];
        if (isset($params['address_id']) && !empty($params['address_id'])) {
            $address = Address::query()->where('uid',auth('api')->id())->where('id', $params['address_id'])->first();
        } else {
            $address = Address::query()->where('uid',auth('api')->id())->where('is_default', 1)->first();
        }
        $data['address'] = $address;
        $data['status_name'] = "待发货";
        return data($data);
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-09
     * @param  [type] $params
     */
    public function order($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = BlindBoxOrder::query()
            ->when(!empty($where['status']), function($query) use($where){
                if ($where['status'] == 1) {
                    $query->where('status', Order::SUCCESS_PAID_ORDER);
                }
                if ($where['status'] == 2) {
                    $query->where('status', Order::WAIT_SHIPPED_ORDER);
                }
                
                if ($where['status'] == 3) {
                    $query->whereIn('status', [Order::HAVE_SHIPPED_ORDER, Order::TRADING_SUCCESS_ORDER]);
                }
            })
            ->orderBy('order_id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        $dealType = BlindBoxDeal::query()->where('status', 1)->get()->keyBy('order_id')->toArray();
        foreach($data['data'] as &$item){
            $item["type_name"] = isset($dealType[$item['rule_type']]) ? $dealType[$item['rule_type']]['title'] : '';
        }

        return lists($data);
    }
}