<?php

/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\Order
 *
 * @property int $order_id
 * @property int $uid 用户id
 * @property string $order_no 订单号
 * @property string $status 订单状态[1、待付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭]
 * @property string|null $amount 实际支付金额
 * @property string|null $raw_amount 订单原金额
 * @property string $contact 收货人
 * @property string $moblie 手机号码
 * @property string|null $shipping_name 物流名称
 * @property string|null $shipping_code 物流单号
 * @property string $address 收货地址
 * @property string|null $close_time 交易关闭时间
 * @property string|null $end_time 交易完成时间
 * @property string|null $payment_time 付款时间
 * @property string|null $consign_time 发货时间
 * @property string|null $create_time 订单创建时间
 * @property string|null $post_fee 邮费
 * @property string $remark 备注
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read mixed $order_status
 * @property-read mixed $status_name
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\OrderGoods[] $orderGoods
 * @property-read int|null $order_goods_count
 * @method static \Illuminate\Database\Eloquent\Builder|Order newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Order newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Order query()
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereAddress($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereCloseTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereConsignTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereContact($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereCreateTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereMoblie($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereOrderId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereOrderNo($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order wherePaymentTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order wherePostFee($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereRawAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereRemark($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereShippingCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereShippingName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereUid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Order whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Order extends Model
{
    protected $table = 'store_order';

    protected $primaryKey = 'order_id';

    protected $guarded = [];

    protected $appends = ['status_name', 'order_status'];
    
    // 订单状态[1、待付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭]
    const WAIT_PAID_ORDER = 1;
    const SUCCESS_PAID_ORDER = 2;
    const WAIT_SHIPPED_ORDER = 3;
    const HAVE_SHIPPED_ORDER = 4;
    const TRADING_SUCCESS_ORDER = 5;
    const TRADING_CLOSED_ORDER = 6;
        
    // 订单状态
    public static $status = [
        self::WAIT_PAID_ORDER         =>      '待付款',
        self::SUCCESS_PAID_ORDER      =>      '已付款',
        self::WAIT_SHIPPED_ORDER      =>      '未发货',
        self::HAVE_SHIPPED_ORDER      =>      '已发货',
        self::TRADING_SUCCESS_ORDER   =>      '交易成功',
        self::TRADING_CLOSED_ORDER    =>      '交易关闭',
    ];

    // 订单描述
    public static $remark = [
        self::WAIT_PAID_ORDER         =>      '订单即将超时，请尽快下单购买！',
        self::SUCCESS_PAID_ORDER      =>      '你的订单已收到，正在处理中！',
        self::WAIT_SHIPPED_ORDER      =>      '货物正在备货中，请耐心等候！',
        self::HAVE_SHIPPED_ORDER      =>      '您的货物已发出，很快送到您的手中！',
        self::TRADING_SUCCESS_ORDER   =>      '您的订单已完成，感谢您的关顾！',
        self::TRADING_CLOSED_ORDER    =>      '订单已关闭，期待您的再次购买！',
    ];

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-07
     */
    public function getStatusNameAttribute()
    {
        return isset($this->attributes['status']) ? self::$status[$this->attributes['status']] : '更新中...';
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-07
     */
    public function getOrderStatusAttribute()
    {
        return isset($this->attributes['status']) ? self::$remark[$this->attributes['status']] : '订单状态更新中...请耐心等待';
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-06
     */
    public function orderGoods()
    {
        return $this->hasMany(OrderGoods::class, 'order_id', 'order_id');
    }
    
}
