<?php
/*
 * @author: ChenGuangHui
 */

namespace App\Http\Controllers\Order;


use App\Http\Controllers\Controller;
use App\Logic\Order\OrderLogic;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function lists(Request $request)
    {
        $pageData = lists_page($request->all());
        return OrderLogic::lists($request->all(), $pageData);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function detail(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer',
        ]);
        return OrderLogic::detail($request->all());
    }

    /**
     * 关闭订单
     *
     * @param Request $request
     *  @throws \App\Exceptions\RJsonError
     */
    public function close(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer',
        ]);
        return OrderLogic::close($request->all());
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-06
     * @param  Request $request
     */
    public function refund(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer',
            'remark' => 'string',
        ]);
        return OrderLogic::refund($request->all());
    }

    /**
     * 
     * @author ChenGuangHui
     * @dateTime 2022-05-06
     * @param  Request $request
     */
    public function confirm(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer'
        ]);
        return OrderLogic::confirm($request->all());
    }
}
