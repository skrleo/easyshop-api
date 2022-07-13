<?php
/*
 * @author: ChenGuangHui
 */
namespace App\Support\Facades;


use Illuminate\Support\Facades\Facade;

/**
 * @package App\Support\Facades
 */
class Lottery extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return 'App\Services\LotteryService';
    }
}
