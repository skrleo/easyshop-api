<?php
/*
 * @author: ChenGuangHui
 */
namespace App\Services\Payment;

use App\Models\BlindBox;
use App\Models\BlindBoxDeal;
use App\Models\BlindBoxOrder;
use App\Models\BlindBoxRule;
use App\Models\PointRecord;
use App\Services\Payment\OrderFactory;
use App\Support\Facades\Lottery;
use EasyWeChat\Factory;
use Illuminate\Database\QueryException;
use Illuminate\Support\Str;

use function EasyWeChat\Kernel\Support\generate_sign;

class BlindBoxService extends OrderFactory
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
        $objOrder->box_id = $order['box_id'];
        $objOrder->uid = auth('api')->id();
        return $objOrder;
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-13
     */
    public function create()
    {
        \DB::beginTransaction();
        try {
            $blindBox = BlindBox::query()->where('id', $this->box_id)->where('status', 1)->first();
            abort_unless($blindBox, 500 , '盲盒不存在');
            $prizeData = BlindBoxRule::query()->where('blind_box_id', $this->box_id)->get()->toArray();
            $blindBoxDeal = BlindBoxDeal::query()->whereIn('id', array_column($prizeData, 'rule_type'))->get()->keyBy('id')->toArray();
            foreach($prizeData as &$prize){
                $prize['rate'] = isset($blindBoxDeal[$prize['rule_type']]) ? $blindBoxDeal[$prize['rule_type']]['virtual_rate'] : 0;
            }
            $data = array(
                'prizes'=> $prizeData
            );
            $prize = Lottery::getInstance($data)->beginPrize();
            
            // 盲盒金额
            $this->amount = $blindBox->price;

            // 创建订单
            $data = [
                'uid' => $this->uid,
                'goods_id' => $prize['goods_id'],
                'goods_name' => $prize['goods_name'],
                'goods_thumb' => $prize['goods_thumb'],
                'number' => 1,
                'goods_price' => $prize['goods_price'],
                'rule_type' => $prize['rule_type'],
                'order_no' => $this->order_no,
                'amount' => $blindBox->price,
                'post_fee' => '8.00',
                'create_time' => date('Y-m-d H:i:s'),
            ];
            
            $order = BlindBoxOrder::query()->create($data);
            // 更改销量
            BlindBox::query()->where('id', $this->box_id)->where('status', 1)->increment('buy_num', 1);
            \DB::commit();
        } catch (QueryException $exception) {
            \DB::rollBack();
            throw new \Exception($exception->getMessage(), $exception->getCode());
        }
        // 返回订单信息
        $this->order = $order;
        $this->prize = $prize;
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
            'order' => $this->order,
            'prize' => $this->prize
        ]);
    }
}