<?php

namespace App\Http\Controllers\Pay;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\BlindBoxOrder;
use App\Models\FreightOrder;
use App\Models\Order;
use App\Services\Pay\OrderService;
use App\Services\PointService;
use EasyWeChat\Factory as WeFactory;

class PayController extends Controller
{
    /**
     * 创建订单
     *
     * @param Request $request
     * @return void
     */
    public function create(Request $request)
    {
        $this->validate($request->all(), [
            'address_id' => 'required|integer|min:1',
            'cart_ids' => 'required_without:goods_id|string', //购物车下单入口，上报购物车ID
            'goods_id' => 'required_without:cart_ids|integer|min:1', //商品详情页立即购买入口
        ]);
        // 创建订单
        $className = '\\App\\Services\\Payment\\'.ucfirst($request->get('type' , 'goods')) .'Service';
        abort_unless(class_exists($className), 500, '创建订单失败');
		$data = $className::getInstance($request->all())->create()->startPay();
        return data($data);
    }

    /**
     * 再次支付
     *
     * @param Request $request
     * @return void
     */
    public function pay(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer|min:1',
        ]);

        $objOrder = Order::query()->where('uid', auth('api')->id())->where('order_id', $request->get('order_id'))->first();
        abort_unless($objOrder, 500, '订单不存在!');
        abort_if($objOrder->status !== Order::WAIT_PAID_ORDER, 500, '订单已关闭！');
        // 发起支付
        $data = array_merge(OrderService::getInstance($objOrder)->startPay(),[
            'order_id' => $objOrder->order_id,
            'order_no' => $objOrder->order_no
        ]);

        return data($data);
    }

    /**
     * 支付回调
     *
     * @param Request $request
     * @return void
     */
    public function callback(Request $request)
    {    
        $config = [
            'app_id'             => env('WECHAT_PAY_APP_ID'),
            'mch_id'             => env('WECHAT_PAY_MCH_ID'),
            'key'                => env('WECHAT_PAY_APP_KEY'),
            'notify_url'         => env('APP_URL') . '/api/wxpay/callback',
        ];

        $app = WeFactory::payment($config);
        $response = $app->handlePaidNotify(function($message, $fail){
            
            $order = Order::query()->where('order_no', $message['out_trade_no'])->first();
            if (!empty($order)) {
                if ($order->status == 2) {
                    return true;
                }
                if ($message['return_code'] === 'SUCCESS') {
                    $data = array(
                        'status' => Order::SUCCESS_PAID_ORDER,
                        'payment_time' => date('Y-m-d H:i:s')
                    );
                    Order::query()->where('order_no', $message['out_trade_no'])->update($data);
                    // 订阅消息

                    return true;
                } else {
                    return $fail('通信失败，请稍后再通知我');
                }
            }
            
            $box = BlindBoxOrder::query()->where('order_no', $message['out_trade_no'])->first();
            if (!empty($box)) {
                if ($box->status == 2) {
                    return true;
                }
                if ($message['return_code'] === 'SUCCESS') {
                    $data = array(
                        'status' => Order::SUCCESS_PAID_ORDER,
                        'payment_time' => date('Y-m-d H:i:s')
                    );
                    BlindBoxOrder::query()->where('order_no', $message['out_trade_no'])->update($data);
                    // 订阅消息
                    
                    // 积分处理，成长值处理
                    (new PointService())->in($box->uid, $box->gift_point, $box->order_id, 1);
                    return true;
                } else {
                    return $fail('通信失败，请稍后再通知我');
                }
            }

            $order = FreightOrder::query()->where('order_no', $message['out_trade_no'])->first();
            if (!empty($order)) {
                if ($order->status == 2) {
                    return true;
                }
                if ($message['return_code'] === 'SUCCESS') {
                    $data = array(
                        'status' => Order::SUCCESS_PAID_ORDER,
                        'payment_time' => date('Y-m-d H:i:s')
                    );
                    FreightOrder::query()->where('order_no', $message['out_trade_no'])->update($data);
                    // 订阅消息
                    $data = array(
                        'status' => Order::WAIT_SHIPPED_ORDER
                    );
                    BlindBoxOrder::query()->where('order_id', $order->related_id)->update($data);
                    return true;
                } else {
                    return $fail('通信失败，请稍后再通知我');
                }

            }
        });
        
        return $response;
    }
}
