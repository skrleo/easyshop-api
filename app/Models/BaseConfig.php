<?php


namespace App\Models;


/**
 * App\Models\BaseConfig
 *
 * @property int $id
 * @property int $type 类型：1、用户协议 2、视频
 * @property string $name 名称
 * @property string $content 内容
 * @property int $status 状态：0 、启用, 1、关闭
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig query()
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig whereContent($value)
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig whereType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|BaseConfig whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class BaseConfig extends Model
{
    protected $table = 'base_config';

    protected $primaryKey = 'id';
}
