<?php
/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2021/9/18 14:22
 */

namespace App\Http\Middleware;

use App\Models\Tenant;
use App\Support\Facades\Rpc;
use Closure;
use Illuminate\Http\Request;

class TenantInitMiddleware
{
    /**
     * @param $request
     * @param Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // $host = explode('.', $request->server('HTTP_HOST'));
        // $rpc = Rpc::getClient();
        // $domain = array_slice($host, -3, 1);
        // $tenant = $rpc->getTenantInit($domain);
        // abort_if($tenant, 500, '平台不存在！');
        // $config = [
        //     'driver' => 'mysql',
        //     'host' => $tenant->host,
        //     'port' => $tenant->port,
        //     'database' => $tenant->database,
        //     'username' => $tenant->account,
        //     'password' => $tenant->password,
        // ];
        // //切换数据库配置
        // Config(["database.connections.store" => $config]);
        return $next($request);
    }
}
