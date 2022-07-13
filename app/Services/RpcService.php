<?php

namespace App\Services;


use Hprose\Http\Client;

class RpcService
{
    /**
     * Class CpsRpcClient
     * @method static getAdminsTree($nextOnly = false, $isRpc = false, $includeCps = false)
     */
    public function getClient()
    {
        return Client::create(config('system.rpc_url'), false);
    }
}
