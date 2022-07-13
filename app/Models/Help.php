<?php


namespace App\Models;


/**
 * App\Models\Help
 *
 * @property int $id
 * @property string $title 标题
 * @property int $status 状态：0 、启用, 1、关闭
 * @property int $sort 排序
 * @property string $description 描述
 * @property int|null $is_show 是否需要展开： 0、否 1、是
 * @property \Illuminate\Support\Carbon $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property int|null $parent_id
 * @property-read \Illuminate\Database\Eloquent\Collection|Help[] $children
 * @property-read int|null $children_count
 * @method static \Illuminate\Database\Eloquent\Builder|Help newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Help newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Help query()
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereIsShow($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereParentId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereSort($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Help whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Help extends Model
{
    public $primaryKey = 'id';

    protected $table = 'store_help';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function children()
    {
        return $this->hasMany(Help::class, 'parent_id', 'id')->where('status', 0);
    }
}
