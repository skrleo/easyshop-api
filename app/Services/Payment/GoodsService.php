<?php
/*
 * @author: ChenGuangHui
 */
/*
 * @author: ChenGuangHui
 */
namespace App\Services\Payment;

use App\Models\Address;
use App\Models\CouponUser;
use App\Models\Freight;
use App\Models\Goods;
use App\Models\GoodsSku;
use App\Models\Order;
use App\Models\OrderGoods;
use App\Models\PointRecord;
use App\Services\Payment\OrderFactory;
use Doctrine\DBAL\FetchMode;
use Illuminate\Support\Arr;
use EasyWeChat\Factory;
use Illuminate\Database\QueryException;
use Illuminate\Support\Str;

use function EasyWeChat\Kernel\Support\generate_sign;

class GoodsService extends OrderFactory
{
     /**
     * @var self[私有化实例]
     */
    protected static $instance;

    /**
     * 参数
     *
     * @var array
     */
    protected static $param = [];

    /**
     * 实例化对象
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-10
     * @param  [type] $obj
     */
    public static function getInstance($order)
    {
        $orderNo = date('YmdHis') . str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
        $objOrder = new static($orderNo);
        $objOrder->order_no = $orderNo;
        $objOrder->uid = auth('api')->id();
        $objOrder->order_type = 1;
        $objOrder->address_id = $order['address_id'];
        $objOrder->coupon_id = isset($order['coupon_id']) ? (int)$order['coupon_id'] : 0;
        $objOrder->type = $order['type'];
        $objOrder->goods_id = $order['goods_id'] ?? 0;
        $objOrder->remark = $order['remark'] ?? '';
        $objOrder->number = $order['number'] ?? 0;
        $objOrder->sku_ids = $order['sku_id'] ?? '';
        return $objOrder;
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-13
     */
    public function create()
    {
        $addressInfo = Address::query()->where('uid', $this->uid)->where('id', $this->address_id)->first();
        abort_unless($addressInfo, 500 , '地址不存在');
        
        $goods = Goods::query()->where('goods_id', $this->goods_id)->where('status', 1)->first();
        abort_unless($goods, 500, '该商品已下架');
        $goods = $goods->toArray();

        \DB::beginTransaction();
        try {
            if ($this->sku_ids) {
                $goodsSku = GoodsSku::query()->where('goods_id', $this->goods_id)->where('spec_sku_id', $this->sku_ids)->first();
                abort_unless($goodsSku, 500, '商品规格异常！');
                $goodsSku = $goodsSku->toArray();
                $line_price  = $goodsSku['line_price'];
                $goods_price = $goodsSku['goods_price'];
                $goods_thumb = $goodsSku['goods_thumb'];
            } else {
                $line_price  = $goods['line_price'];
                $goods_price = $goods['goods_price'];
                $goods_thumb = Arr::first(array_column(json_decode($goods['goods_thumb'], true), 'url'));
            }

            $goods = [
                'uid' => $this->uid,
                'goods_id' => $this->goods_id,
                'goods_price' => $goods_price,
                'line_price' => $line_price,
                'goods_name' => $goods['goods_name'],
                'sku' => $this->sku_ids ?? '',
                'number' => $this->number,
                'gift_growth' => $goods['gift_growth'] ?? 0,
                'gift_point' => $goods['gift_point'] ?? 0,
                'goods_thumb' => $goods_thumb,
            ];

            // 订单金额统计
            $this->amount = $goods['goods_price'];
            $this->raw_amount = $goods['line_price'];

            //写入订单
            $order = [
                'uid' => $this->uid,
                'order_no' => $this->order_no,
                'order_type' => $this->order_type,
                'amount' => $this->amount,
                'raw_amount' => $this->raw_amount ?? 0,
                'create_time' => date('Y-m-d H:i:s'),
                'contact' => $addressInfo->contact,
                'moblie' => $addressInfo->moblie,
                'address' => $addressInfo->province . $addressInfo->city . $addressInfo->region . $addressInfo->address,
                'remark' => $this->remark ?? '',
            ];

            $order = Order::query()->create($order);
            $data = array_merge($goods, [
                'order_id' => $order->getQueueableId(),
            ]);
            OrderGoods::query()->create($data);

            $goods = Goods::query()->where('goods_id', $this->goods_id)->first();
            abort_unless($goods, 500, '商品不存在');
            
            // 检测规格
            if ($this->sku_ids) {
                $goodsSku = GoodsSku::query()->where('spec_sku_id', $this->sku_ids)->first();
                abort_unless($goodsSku, 500, '商品规格异常');
                abort_if($goodsSku->stock_num < $this->number, 500, "库存不足！");
                GoodsSku::query()->where('spec_sku_id', $goods->sku_ids)->increment('goods_sales', $this->number);
                GoodsSku::query()->where('spec_sku_id', $goods->sku_ids)->decrement('stock_num', $this->number);
            }
            abort_if($goods->stock_num < $this->number, 500, "库存不足！");
            Goods::query()->where('goods_id', $this->goods_id)->decrement('stock_num', $this->number);
            Goods::query()->where('goods_id', $this->goods_id)->increment('goods_sales',  $this->number);
            if ($this->coupon_id) {
                // 优惠券
                $coupon = CouponUser::query()->where('coupon_id', $this->coupon_id)->where('status', 1)->first();
                abort_unless($coupon, 500, '优惠券不可用！');
                $this->amount = bcsub($this->amount, $coupon->coupon_amount);
            }
            // 邮费
            // Freight::query()->where('id', $goods->feight_template_id)->first();
            \DB::commit();
        } catch (QueryException $exception) {
            \DB::rollBack();
            throw new \Exception($exception->getMessage(), $exception->getCode());
        }
        // 返回订单信息
        $this->order = $order;
        return $this;
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-13
     */
    public function startPay()
    {
        $config = [
            'app_id'             => env('WECHAT_PAY_APP_ID'),
            'mch_id'             => env('WECHAT_PAY_MCH_ID'),
            'key'                => env('WECHAT_PAY_APP_KEY'),
            'notify_url'         => env('APP_URL') . '/api/wxpay/callback',
        ];
        \Log::info("创建订单:". json_encode($config,true));
        $app = Factory::payment($config);

        $response = $app->order->unify([
            'body'         => Str::limit('商户订单' . $this->order_no),
            'out_trade_no' => $this->order_no,
            'trade_type'   => 'JSAPI',
            'openid'       => auth('api')->user()->openid,
            'total_fee'    => $this->amount * 100, // 总价
        ]);

        // 如果成功生成统一下单的订单，那么进行二次签名
        if ($response['return_code'] === 'SUCCESS') {
            // 二次签名的参数必须与下面相同
            $result = [
                'appId'     => env('WECHAT_PAY_APP_ID'),
                'timeStamp' => (string)time(),
                'nonceStr'  => $response['nonce_str'],
                'package'   => 'prepay_id=' . $response['prepay_id'],
                'signType'  => 'MD5',
            ];

            $result['paySign'] = generate_sign($result, env('WECHAT_PAY_APP_KEY'));
        } else {
            throw new \Exception('订单支付异常！', 500);
        }
        return array_merge($result, [
            'order' => $this->order
        ]);
    }
}