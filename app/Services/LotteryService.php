<?php
/*
 * @author: ChenGuangHui
 */
/*
 * @author: ChenGuangHui
 */
/*
 * 抽奖概率处理
 * 
 * @author: ChenGuangHui
 * @date 2022-06-18 16:04:56
 */

namespace App\Services;

use App\Exceptions\RJsonError;

class LotteryService
{
    /**
     * @var self[私有化实例]
     */
    protected static $instance;

    /**
     * 参数
     *
     * @var array
     */
    protected static $param = [];

    /**
     * 实例化对象
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-10
     * @param  [type] $obj
     */
    public static function getInstance($data)
    {
        self::$param = $data;

        if (!(self::$instance instanceof self)) {
            self::$instance = new static();
        }
        return self::$instance;
    }

    /**
     * 根据获取几率获取抽奖
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-11
     */
    public function beginPrize()
    {
        $data = [];
        $ruleType = collect(self::$param['prizes'])->groupBy('rule_type')->toArray();
        foreach (self::$param['prizes'] as $prize) {
            // 分配中奖概率
            $prizeRate = $prize['rate'] * 100;
            if (count($ruleType[$prize['rule_type']]) > 1) {
                $restNum = $prizeRate % count($ruleType[$prize['rule_type']]);
                if ($restNum > 0) {
                    $data[$prize['id']] = ceil($prizeRate / count($ruleType[$prize['rule_type']]));
                } else {
                    $data[$prize['id']] = $prizeRate / count($ruleType[$prize['rule_type']]);
                }
            } else {
                $data[$prize['id']] = $prizeRate;
            }
        }
        shuffle($data);
        //根据概率获取奖项
        return self::$param['prizes'][$this->get_rand($data)];
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-11
     * @param array $lottery
     */
    public function get_rand($lottery)
    {
        $prizeId = 0;
        //概率数组的总概率精度 
        $totalRate = array_sum($lottery);
        abort_if($totalRate < 100, 500, '抽奖概率异常！');
        //概率数组循环 
        foreach ($lottery as $key => $prize) {
            $randNum = mt_rand(1, $totalRate);
            if ($randNum <= $prize) {
                $prizeId = $key;
                break;
            } else {
                $totalRate -= $prize;
            }
        }
        return $prizeId;
    }
}
