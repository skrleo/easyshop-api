<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\Spec
 *
 * @property int $id 规格组id
 * @property string $spec_name 规格组名称
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder|Spec newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Spec newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Spec query()
 * @method static \Illuminate\Database\Eloquent\Builder|Spec whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Spec whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Spec whereSpecName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Spec whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Spec extends Model
{
    protected $table = 'store_spec';

    protected $primaryKey = 'id';

}
