<?php
namespace App\Support\Facades;


use App\Support\IdeHelper\CpsRpcClient;
use Illuminate\Support\Facades\Facade;

/**
 * @package App\Support\Facades
 */
class Oss extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return 'App\Services\OssService';
    }
}
