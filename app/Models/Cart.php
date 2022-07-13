<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\Cart
 *
 * @property int $id
 * @property int $uid 用户id
 * @property string $goods_name 商品名称
 * @property int $goods_id 商品id
 * @property string $spec_sku_id 商品sku记录索引 (由规格id组成)
 * @property string $goods_no 商品编码
 * @property string $goods_thumb 商品封面
 * @property string $goods_price 商品价格
 * @property string $line_price 商品划线价
 * @property int $number 购买数量
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read \App\Models\Goods|null $goods
 * @method static \Illuminate\Database\Eloquent\Builder|Cart newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Cart newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Cart query()
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereGoodsId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereGoodsName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereGoodsNo($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereGoodsPrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereGoodsThumb($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereLinePrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereNumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereSpecSkuId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereUid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Cart whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Cart extends Model
{
    protected $table = 'store_cart';

    protected $primaryKey = 'id';

    protected $guarded = [];

    public function goods()
    {
        return $this->hasOne(Goods::class, 'goods_id', 'goods_id');
    }
}
