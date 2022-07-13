<?php

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\OrderRefund
 *
 * @property int $id
 * @property int $order_id 订单ID
 * @property int $uid 用户id
 * @property string $order_no 订单号
 * @property string $status 订单状态[1、待处理，2、处理中，3、处理完成]
 * @property string $contact 收货人
 * @property string $moblie 手机号码
 * @property string|null $shipping_name 物流名称
 * @property string|null $shipping_code 物流单号
 * @property string|null $post_fee 邮费
 * @property string $remark 备注
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund query()
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereContact($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereMoblie($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereOrderId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereOrderNo($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund wherePostFee($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereRemark($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereShippingCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereShippingName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereUid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderRefund whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class OrderRefund extends Model
{
    protected $table = 'store_order_refund';

    protected $primaryKey = 'id';

    protected $guarded = [];
}
