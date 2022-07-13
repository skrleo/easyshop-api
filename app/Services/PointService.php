<?php
/*
 * 积分处理
 * 
 * @author: ChenGuangHui
 * @date 2022-06-18 16:04:56
 */

namespace App\Services;

use App\Exceptions\RJsonError;
use App\Models\PointRecord;
use App\Models\User;

class PointService
{
    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-18
     * @param [type] $point
     */
    public function in($uid, $point, $sourceId, $sourceType, $remark = '')
    {
        $data = array(
            'uid' => $uid,
            'source_id' => $sourceId,
            'source_type' => $sourceType,
            'symbol' => 'in',
            'point' => $point,
            'remark' => $remark
        );
        $point = PointRecord::query()->create($data);
        User::query()->where('uid', $uid)->increment('point', $point);
        return true;
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-18
     * @param [type] $point
     */
    public function out($point)
    {
        # code...
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-18
     * @param [type] $point
     */
    public function cancel($point)
    {
        # code...
    }
}