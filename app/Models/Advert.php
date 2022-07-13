<?php

namespace App\Models;


/**
 * App\Models\Advert
 *
 * @property int $id
 * @property string $name 名称
 * @property string|null $start_time 开始时间
 * @property string|null $end_time 结束时间
 * @property int $status 状态：0 、启用, 1、关闭
 * @property int $jump_type 跳转类型： 0、商品Id 1、链接
 * @property string $thumb 图片地址
 * @property string $jump_url 跳转地址
 * @property int $sort 排序
 * @property string $bgcolor 背景颜色
 * @property int|null $type 类型：1、无限期  2、 限制时间
 * @property int|null $module 类型： 0、商品分类 1、轮播图 2、栏目 3、其他
 * @property string $remark 描述
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder|Advert newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Advert newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Advert query()
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereBgcolor($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereJumpType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereJumpUrl($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereModule($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereRemark($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereSort($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereThumb($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Advert whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Advert extends Model
{
    protected $table = 'store_advert';

    protected $primaryKey = 'id';

    protected $guarded = [];
}
