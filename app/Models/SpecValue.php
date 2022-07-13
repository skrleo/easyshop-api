<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\SpecValue
 *
 * @property int $id 规格值id
 * @property string $spec_value 规格值
 * @property int $spec_id 规格组id
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue query()
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue whereSpecId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue whereSpecValue($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SpecValue whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class SpecValue extends Model
{
    protected $table = 'store_spec_value';

    protected $primaryKey = 'id';

}
