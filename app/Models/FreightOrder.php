<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

class FreightOrder extends Model
{
    protected $table = 'store_freight_order';

    protected $primaryKey = 'order_id';
    
    protected $guarded = [];
}
