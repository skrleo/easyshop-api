<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\GoodsSpec
 *
 * @property int $id 主键id
 * @property int $goods_id 商品id
 * @property int $spec_id 规格组id
 * @property int $spec_value_id 规格值id
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read \App\Models\SpecValue|null $SpecValue
 * @property-read \App\Models\Spec|null $spec
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec query()
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec whereGoodsId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec whereSpecId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec whereSpecValueId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSpec whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class GoodsSpec extends Model
{
    protected $table = 'store_goods_spec';

    protected $primaryKey = 'id';

    public function spec()
    {
        return $this->hasOne(Spec::class, 'id', 'spec_id');
    }

    public function SpecValue()
    {
        return $this->hasOne(SpecValue::class, 'id', 'spec_value_id');
    }
}
