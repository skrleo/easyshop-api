<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

/**
 * App\Models\Coupon
 *
 * @property int $id
 * @property string $name 名称
 * @property string $coupon_type 优惠券类型：1直减现金券2满减现金券
 * @property string $coupon_amount 优惠金额
 * @property string|null $full_amount 满减金额
 * @property string $grant_start_time 发放开始时间
 * @property string $grant_end_time 发放结束时间
 * @property string|null $ref_ids 关联id
 * @property string $effective_start_time 生效时间
 * @property string $effective_end_time 失效时间
 * @property int $status 状态:1、已提交;2、启用;3、发放中;4、暂停;5、结束;
 * @property int $quantity 发放数量
 * @property string|null $remark 优惠券描述
 * @property string $repeat_quantity 每人可重复领取数量
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon query()
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereCouponAmout($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereCouponType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereEffectiveEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereEffectiveStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereFullAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereGrantEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereGrantStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereQuantity($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereRefIds($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereRemark($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereRepeatQuantity($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Coupon whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Coupon extends Model
{

    protected $table = 'store_coupon';

    protected $primaryKey = 'id';
    
    protected $guarded = [];

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-27
     */
    public function couponUser()
    {
        return $this->hasMany(CouponUser::class, 'coupon_id', 'id');
    }
}
