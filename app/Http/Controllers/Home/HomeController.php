<?php
/*
 * @author: ChenGuangHui
 */

namespace App\Http\Controllers\Home;


use App\Http\Controllers\Controller;
use App\Logic\Home\HomeLogic;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * @param Request $request
     * @return mixed
     */
    public function lists(Request $request)
    {
        return HomeLogic::lists($request->all());
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function activity(Request $request)
    {
        return HomeLogic::activity($request->all());
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function share(Request $request)
    {
        $this->validate($request->all(), [
            'module' => 'required|string',
        ]);
        return (new HomeLogic())->share($request->all());
    }

    /**
     * 帮助中心
     * 
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  Request $request
     */
    public function help(Request $request)
    {
        return (new HomeLogic())->help($request->all());
    }
    
    /**
     * 平台信息
     * 
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  Request $request
     */
    public function tenant(Request $request)
    {
        return (new HomeLogic())->tenant($request->all());
    }
    
    /**
     * 文本解析
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function resolve(Request $request)
    {
        $this->validate($request->all(), [
            'type' => 'required|string',
        ]);
        return HomeLogic::resolve($request->all());
    }

}
