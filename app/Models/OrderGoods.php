<?php
/*
 * @author: ChenGuangHui
 */
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

/**
 * App\Models\OrderGoods
 *
 * @property int $id
 * @property int $uid 用户id
 * @property int $order_id 订单ID
 * @property int $goods_id 商品Id
 * @property string|null $goods_price 价格
 * @property string|null $line_price 原价格
 * @property string $goods_name 商品名称
 * @property string $goods_thumb
 * @property string $sku 规格
 * @property int $number 购买数量
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property int|null $buyer_rate 是否已评: 0、否；1、是
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods query()
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereBuyerRate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereGoodsId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereGoodsName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereGoodsPrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereGoodsThumb($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereLinePrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereNumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereOrderId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereSku($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereUid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|OrderGoods whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class OrderGoods extends Model
{
    protected $table = 'store_order_goods';

    protected $primaryKey = 'id';

    protected $guarded = [];

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-13
     */
    public function order()
    {
        return $this->hasOne(Order::class, 'order_id', 'order_id');
    }

}
