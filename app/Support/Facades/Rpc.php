<?php
namespace App\Support\Facades;


use App\Support\IdeHelper\CpsRpcClient;
use Illuminate\Support\Facades\Facade;

/**
 * Class Rpc
 * @method static CpsRpcClient getCpsClient()
 * @package App\Support\Facades
 */
class Rpc extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return 'App\Services\RpcService';
    }
}
