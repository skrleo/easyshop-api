<?php
/*
 * @author: ChenGuangHui
 */
namespace App\Services\Payment;

use App\Contracts\OrderInterface;

abstract class OrderFactory implements OrderInterface
{
    /**
     * 实例化对象
     *
     * @return array
     */
    abstract public static function getInstance($params);
    
    /**
     * 创建订单
     *
     * @return this
     */
    abstract public function create();

    /**
     * 调起支付
     *
     * @return array
     */
    abstract public function startPay();
}