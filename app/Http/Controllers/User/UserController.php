<?php
/*
 * @author: ChenGuangHui
 */
/**
 * Created by PhpStorm.
 * User: chenguanghui
 * Date: 2021/4/1
 * Time: 16:13
 */
namespace App\Http\Controllers\User;


use App\Http\Controllers\Controller;
use App\Logic\User\UserLogic;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  Request $request
     */
    public function personal(Request $request)
    {
        return (new UserLogic())->personal($request->all());
    }
    
    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  Request $request
     */
    public function member(Request $request)
    {
        return (new UserLogic())->member($request->all());
    }

    /**
     * 积分
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-20
     * @param Request $request
     */
    public function point(Request $request)
    {
        return (new UserLogic())->point($request->all(), lists_page($request->all()));
    }

    /**
     * 成长值
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-20
     * @param Request $request
     */
    public function growth(Request $request)
    {
        return (new UserLogic())->growth($request->all(), lists_page($request->all()));
    }
}
