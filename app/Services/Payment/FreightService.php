<?php
/*
 * @author: ChenGuangHui
 */
namespace App\Services\Payment;

use App\Models\Address;
use App\Models\BlindBoxOrder;
use App\Models\FreightOrder;
use App\Models\Order;
use App\Services\Payment\OrderFactory;
use EasyWeChat\Factory;
use Illuminate\Database\QueryException;
use Illuminate\Support\Str;

use function EasyWeChat\Kernel\Support\generate_sign;

class FreightService extends OrderFactory
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
        $orderNo = 'YF'. date('YmdHis') . str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
        $objOrder = new static($orderNo);
        $objOrder->order_no = $orderNo;
        $objOrder->rule_type = 1;
        $objOrder->related_id = $order['order_id'];
        $objOrder->address_id = $order['address_id'];
        $objOrder->uid = auth('api')->id();
        return $objOrder;
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-13
     */
    public function create()
    {
        $order = BlindBoxOrder::query()->where('uid', $this->uid)->where('order_id', $this->related_id)->first();
        abort_unless($order, 500 , '盲盒订单不存在');
        $address = Address::query()->where('uid', $this->uid)->where('id', $this->address_id)->first();
        abort_unless($address, 500 , '地址不存在');

        \DB::beginTransaction();
        try {
            $order = $order->toArray();
            $address = $address->toArray();
            $restrict = array(
                '澳门特别行政区', '香港特别行政区', '台湾省'
            );
            abort_if(in_array($address['province'], $restrict), 500, '该地区不支持配送！');

            $remote = array(
                '新疆维吾尔自治区', '宁夏回族自治区', '青海省'
            );

            if (in_array($address['province'], $remote)) {
                $this->amount = 16;
            } else {
                $this->amount = 0.01;
            }

            // 创建订单
            $data = [
                'uid' => $this->uid,
                'related_id' => $this->related_id,
                'order_no' => $this->order_no,
                'rule_type' => $this->rule_type,
                'amount' => $this->amount,
                'contact' => $address['contact'],
                'moblie' => $address['moblie'],
                'address' => $address['province'] . $address['city'] . $address['region'] . $address['address'],
                'create_time' => date('Y-m-d H:i:s'),
            ];
            
            FreightOrder::query()->create($data);
            
            $data = array(
                'contact' => $address['contact'],
                'moblie' => $address['moblie'],
                'address' => $address['province'] . $address['city'] . $address['region'] . $address['address'],
                // 'remark' => $this->remark ?? '',
            );
            BlindBoxOrder::query()->where('uid', $this->uid)->where('order_id', $this->related_id)->update($data);

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