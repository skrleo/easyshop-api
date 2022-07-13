<?php


namespace App\Http\Middleware;

use Closure;
use Jenssegers\Agent\Agent;
use Log;

class OperationLogMiddleware
{
    /**
     * @param $request
     * @param Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // if (app()->environment('production')) {
        //     if (auth('api')->check()){
        //         $userString = join(' ', array_filter([auth('api')->id(), auth('api')->user()->name,auth('api')->user()->email]));
        //         $uri = $request->path();
        //         $method = $request->method();
        //         $userAgent = (new Agent())->getUserAgent();
        //         $ip = $request->getClientIp();
        //         $ipInfo = join(' ',array_unique(array_filter([get_client_ip(2)])));
        //         $queryString = http_build_query($request->except(['password', 'sn', 'token']));
        //         $logMsg = join([$userString, $method . ' ' . $uri . ' ' . $queryString, $userAgent, $ip, $ipInfo], ' | ');
        //         Log::channel('operation')->info($logMsg . PHP_EOL);
        //     }
        // }

        return $next($request);
    }
}
