<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/04/13 11:00
 */

namespace App\Models;

use App\Models\Model;

class CouponRule extends Model
{
    protected $table = 'store_coupon_rule';

    protected $primaryKey = 'id';
    
    protected $guarded = [];
}
