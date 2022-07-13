<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\Goods
 *
 * @property int $goods_id
 * @property string $goods_name 商品名称
 * @property string $title
 * @property int|null $feight_template_id 运费模版id
 * @property string $goods_price 商品价格
 * @property string $line_price 商品划线价
 * @property int|null $sort 排序
 * @property int|null $status 状态[0、待上架; 1、已上架; 2、下架]
 * @property int|null $stock_num 商品库存
 * @property int|null $limit_num 限购数量,0 则不限购
 * @property int|null $goods_sales 商品销量
 * @property int|null $gift_growth 赠送的成长值
 * @property int|null $gift_point 赠送的积分
 * @property int|null $use_point_limit 限制使用的积分数
 * @property int|null $low_stock 库存预警值
 * @property string $service_ids 服务：1->无忧退货；2->快速退款；3->免费包邮
 * @property string|null $promotion_start_time 促销开始时间
 * @property string|null $promotion_end_time 促销结束时间
 * @property int|null $promotion_per_limit 活动限购数量
 * @property string $goods_thumb 商品封面
 * @property string $content 商品内容
 * @property string $md_content 商品内容
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Cart[] $carts
 * @property-read int|null $carts_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\GoodsSku[] $goodsSku
 * @property-read int|null $goods_sku_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\GoodsSpec[] $goodsSpec
 * @property-read int|null $goods_spec_count
 * @method static \Illuminate\Database\Eloquent\Builder|Goods newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Goods newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Goods query()
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereContent($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereFeightTemplateId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereGiftGrowth($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereGiftPoint($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereGoodsId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereGoodsName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereGoodsPrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereGoodsSales($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereGoodsThumb($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereLimitNum($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereLinePrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereLowStock($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereMdContent($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods wherePromotionEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods wherePromotionPerLimit($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods wherePromotionStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereServiceIds($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereSort($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereStockNum($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Goods whereUsePointLimit($value)
 * @mixin \Eloquent
 */
class Goods extends Model
{
    protected $table = 'store_goods';

    protected $primaryKey = 'goods_id';

    protected $guarded = [];

    public function goodsSku()
    {
        return $this->hasMany(GoodsSku::class, 'goods_id', 'goods_id');
    }

    public function goodsSpec()
    {
        return $this->hasMany(GoodsSpec::class, 'goods_id', 'goods_id');
    }

    public function carts()
    {
        return $this->hasMany(Cart::class, 'goods_id', 'goods_id');
    }
}
