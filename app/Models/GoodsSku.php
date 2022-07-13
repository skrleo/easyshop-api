<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\GoodsSku
 *
 * @property int $sku_id 商品规格id
 * @property int $goods_id 商品id
 * @property string $spec_sku_id 商品sku记录索引 (由规格id组成)
 * @property string $goods_no 商品编码
 * @property string $goods_thumb 商品封面
 * @property string $goods_price 商品价格
 * @property string $line_price 商品划线价
 * @property int $stock_num 当前库存数量
 * @property int $goods_sales 商品销量
 * @property float $goods_weight 商品重量(Kg)
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property int|null $low_stock 库存预警值
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku query()
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereGoodsId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereGoodsNo($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereGoodsPrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereGoodsSales($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereGoodsThumb($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereGoodsWeight($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereLinePrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereLowStock($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereSkuId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereSpecSkuId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereStockNum($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GoodsSku whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class GoodsSku extends Model
{
    protected $table = 'store_goods_sku';

    protected $primaryKey = 'sku_id';

}
