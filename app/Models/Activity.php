<?php


namespace App\Models;


/**
 * App\Models\Activity
 *
 * @property int $id
 * @property string $name 活动名称
 * @property int $jump_type 跳转类型： 0、商品Id 1、链接
 * @property string $thumb 图片地址
 * @property string|null $start_time 开始时间
 * @property string $app_id 小程序Id
 * @property int $sort 排序
 * @property string|null $end_time 结束时间
 * @property int $status 状态：0 、启用, 1、关闭
 * @property string $jump_url 跳转地址
 * @property string $remark
 * @property \Illuminate\Support\Carbon $created_at 创建时间
 * @property \Illuminate\Support\Carbon $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder|Activity newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Activity newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Activity query()
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereAppId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereJumpType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereJumpUrl($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereRemark($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereSort($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereThumb($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Activity whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Activity extends Model
{
    protected $table = 'store_activity';

    protected $primaryKey = 'id';

    protected $fillable = ['name', 'type', 'jump_type', 'thumb', 'start_time', 'end_time','status'];
}
