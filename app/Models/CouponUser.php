<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;


/**
 * App\Models\CouponUser
 *
 * @property int $id 主键
 * @property int|null $uid 用户id
 * @property int|null $coupon_id
 * @property int|null $coupon_type 优惠类型
 * @property string|null $code_no 优惠券编码
 * @property string|null $coupon_amount 优惠金额
 * @property string|null $full_amount 满减金额
 * @property string|null $effective_start_time 生效时间
 * @property string|null $effective_end_time 失效时间
 * @property int|null $status 状态：-1已作废 0待使用 1已使用 2已过期
 * @property string|null $use_time 使用时间
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at 修改时间
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser query()
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereCodeNo($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereCouponAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereCouponId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereCouponType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereEffectiveEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereEffectiveStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereFullAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereUid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CouponUser whereUseTime($value)
 * @mixin \Eloquent
 */
class CouponUser extends Model
{
    protected $table = 'store_coupon_user';

    protected $primaryKey = 'id';
    
    protected $guarded = [];
}
