<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;


/**
 * App\Models\Freight
 *
 * @property int $id 主键
 * @property string|null $name 模板名称
 * @property string|null $ship_place 发货地
 * @property int|null $status 状态[1、正常；2、关闭]
 * @property string $postage_free 包邮地区
 * @property string $delivery_area 配送区域
 * @property string $not_delivery 不配送区域
 * @property int|null $freight_type 计费方式：1、按件数计费 2、按重量计费
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at 修改时间
 * @method static \Illuminate\Database\Eloquent\Builder|Freight newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Freight newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Freight query()
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereDeliveryArea($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereFreightType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereNotDelivery($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight wherePostageFree($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereShipPlace($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Freight whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Freight extends Model
{
    protected $table = 'store_freight';

    protected $primaryKey = 'id';
    
    protected $guarded = [];
}
