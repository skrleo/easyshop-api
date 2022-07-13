<?php

namespace App\Http\Controllers\Login;


use App\Http\Controllers\Controller;
use App\Logic\Login\LoginLogic;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /**
     * 用户登录
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \EasyWeChat\Kernel\Exceptions\InvalidConfigException
     */
    public function login(Request $request)
    {
        return LoginLogic::login($request->all());
    }

    /**
     * 账号同步
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-09
     * @param  Request $request
     */
    public function sync(Request $request)
    {
        return (new LoginLogic())->sync($request->all());
    }

   /**
    * 用户授权登录
    
    * @author ChenGuangHui
    * @dateTime 2022-06-09
    * @param  Request $request
    */
    public function oauth(Request $request)
    {
        $this->validate($request->all(), [
            'session' => 'required|string',
            'iv' => 'required|string',
            'encrypted' => 'required|string',
            'openid' => 'required|string',
        ]);
        return (new LoginLogic())->oauth($request->all());
    }
}
