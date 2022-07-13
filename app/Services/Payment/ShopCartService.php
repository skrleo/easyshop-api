<?php
/*
 * @author: ChenGuangHui
 */
namespace App\Services\Payment;

use App\Models\Address;
use App\Models\Cart;
use App\Models\CouponUser;
use App\Models\Goods;
use App\Models\GoodsSku;
use App\Models\Order;
use App\Models\OrderGoods;
use App\Models\PointRecord;
use App\Services\Payment\OrderFactory;
use EasyWeChat\Factory;
use Illuminate\Database\QueryException;
use Illuminate\Support\Str;

use function EasyWeChat\Kernel\Support\generate_sign;

class ShopCartService extends OrderFactory
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
        $objOrder->address_id = $order['address_id'];
        $objOrder->coupon_id = isset($order['coupon_id']) ? (int)$order['coupon_id'] : 0;
        $objOrder->type = $order['type'];
        $objOrder->order_type = 1;
        $objOrder->cart_ids = $order['cart_ids'];
        $objOrder->remark = $order['remark'] ?? '';
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

        \DB::beginTransaction();
        try {
            $goodsData = [];
            $cart = Cart::query()->with('goods')->where('uid', auth('api')->id())->whereIn('id', explode(',', $this->cart_ids))->get()->toArray();
            foreach($cart as $car){
                $goods = Goods::query()->where('goods_id', $car['goods_id'])->where('status', 1)->first();
                abort_unless($goods, 500, '该商品已下架');

                $goodsData[] = [
                    'uid' => auth('api')->id(),
                    'goods_id' => $car['goods_id'],
                    'goods_price' => $car['goods_price'],
                    'line_price' => $car['line_price'],
                    'goods_name' => $car['goods_name'],
                    'sku' => $car['spec_sku_id'],
                    'number' => $car['number'],
                    'gift_growth' => $goods->gift_growth,
                    'gift_point' => $goods->gift_point,
                    'goods_thumb' =>$car['goods_thumb'],
                ];

                // 减去商品库存
                if (!empty($car['spec_sku_id'])) {
                    $goodsSku = GoodsSku::query()->where('spec_sku_id', $car['spec_sku_id'])->where('goods_id', $car['goods_id'])->first();
                    abort_unless($goodsSku, 500, '商品规格异常！');
                    GoodsSku::query()->where('spec_sku_id', $car['spec_sku_id'])->where('goods_id', $car['goods_id'])->increment('goods_sales', $car['number']);
                    GoodsSku::query()->where('spec_sku_id', $car['spec_sku_id'])->where('goods_id', $car['goods_id'])->decrement('stock_num', $car['number']);
                    // 检查规格库存
                    abort_if($goodsSku['stock_num'] < $car['number'], 500, "库存不足！");
                } else {
                    abort_if($goods['stock_num'] < $car['number'], 500, "库存不足！");
                }
                
                Goods::query()->where('goods_id', $car['goods_id'])->decrement('stock_num', $car['number']);
                Goods::query()->where('goods_id', $car['goods_id'])->increment('goods_sales', $car['number']);
            }
            
            // 删除购物车
            Cart::query()->where('uid', $this->uid)->whereIn('id', explode(',', $this->cart_ids))->delete();

            $this->amount = $this->raw_amount = 0.01;

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

            foreach($goodsData as $goods){
                $data = array_merge($goods, [
                    'order_id' => $order->getQueueableId(),
                ]);
                OrderGoods::query()->create($data);
            }
            // 优惠券
            if ($this->coupon_id) {
                $coupon = CouponUser::query()->where('coupon_id', $this->coupon_id)->where('status', 1)->first();
                abort_unless($coupon, 500, '优惠券不可用！');
                $this->amount = bcsub($this->amount, $coupon->coupon_amount);
            }
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