<?php

namespace App\Services\Pay;

use App\Models\Order;
use EasyWeChat\Factory as WeFactory;
use Illuminate\Support\Str;

use function EasyWeChat\Kernel\Support\generate_sign;

class OrderService
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
     * @param  object $data
     */
    public static function getInstance(Order $data)
    {
        self::$param = $data;
        if (!(self::$instance instanceof self)) {
            self::$instance = new static();
        }
        return self::$instance;
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-07
     */
    public function startPay()
    {
        $config = [
            'app_id'             => env('WECHAT_PAY_APP_ID'),
            'mch_id'             => env('WECHAT_PAY_MCH_ID'),
            'key'                => env('WECHAT_PAY_APP_KEY'),
            'notify_url'         => env('APP_URL') . '/api/wxpay/callback',
        ];
        $app = WeFactory::payment($config);

        $result = $app->order->unify([
            'body'         => Str::limit('商户订单' . self::$param["order_no"]),
            'out_trade_no' => self::$param["order_no"],
            'trade_type'   => 'JSAPI',
            'openid'       => auth('api')->user()->openid,
            'total_fee'    => self::$param["amount"] * 100, // 总价
        ]);

        // 如果成功生成统一下单的订单，那么进行二次签名
        if ($result['return_code'] === 'SUCCESS') {
            // 二次签名的参数必须与下面相同
            $params = [
                'appId'     => 'wx18de60cc2f0b2af4',
                'timeStamp' => (string)time(),
                'nonceStr'  => $result['nonce_str'],
                'package'   => 'prepay_id=' . $result['prepay_id'],
                'signType'  => 'MD5',
            ];

            $params['paySign'] = generate_sign($params, env('WECHAT_PAY_APP_KEY'));
            return $params;
        } else {
            throw new \Exception('订单支付异常！', 500);
        }
    }

    /**
     * 订单退款
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-20
     */
    public function refund()
    {
        $config = [
            'app_id'             => env('WECHAT_PAY_APP_ID'),
            'mch_id'             => env('WECHAT_PAY_MCH_ID'),
            'key'                => env('WECHAT_PAY_APP_KEY'),
            'notify_url'         => env('APP_URL') . '/api/wxpay/callback',
        ];
        $app = WeFactory::payment($config);
        // 参数分别为：商户订单号、商户退款单号、订单金额、退款金额、其他参数
        $result = $app->refund->byOutTradeNumber('out-trade-no-xxx', 'refund-no-xxx', 20000, 1000, [
            // 可在此处传入其他参数，详细参数见微信支付文档
            'refund_desc' => '退运费',
        ]);
        return $result;
    }
}
