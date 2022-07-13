<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

/**
 * App\Models\FreightRule
 *
 * @property int $id
 * @property string|null $name 地区名称
 * @property int|null $freight_type 计费方式：1、按件数计费 2、按重量计费
 * @property int|null $freight_id 关联id
 * @property int|null $figure 计算数量(件、重量)
 * @property string|null $amount 运费金额
 * @property int|null $increase_figure 增加计算数量(件、重量)
 * @property string|null $increase_amount 增加运费金额
 * @property int|null $cond_figure 条件（满多少包邮）
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule query()
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereCondFigure($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereFigure($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereFreightId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereFreightType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereIncreaseAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereIncreaseFigure($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|FreightRule whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class FreightRule extends Model
{
    protected $table = 'store_freight_rule';

    protected $primaryKey = 'id';
    
    protected $guarded = [];
}
