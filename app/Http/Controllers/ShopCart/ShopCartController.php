<?php
/*
 * @author: ChenGuangHui
 */
namespace App\Http\Controllers\ShopCart;


use App\Http\Controllers\Controller;
use App\Logic\ShopCart\ShopCartLogic;
use Illuminate\Http\Request;

class ShopCartController extends Controller
{
    /**
     * 购物车列表
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function lists(Request $request)
    {
        return (new ShopCartLogic())->lists($request->all(), lists_page($request->all()));
    }

    /**
     * 添加购物车
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function store(Request $request)
    {
        return (new ShopCartLogic())->store($request->all());
    }
    
    /**
     * 更新
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function update(Request $request)
    {
        $this->validate($request->all(), [
            'id' => 'required|integer',
        ]);
        return (new ShopCartLogic())->update($request->all());
    }

    /**
     * 商品信息
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function info(Request $request)
    {
        $this->validate($request->all(), [
            // 'cart_ids' => 'required|string',
        ]);
        return (new ShopCartLogic())->info($request->all());
    }

    /**
     * 删除购物车
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function delete(Request $request)
    {
        $this->validate($request->all(), [
            'id' => 'required|integer',
        ]);
        return (new ShopCartLogic())->delete($request->all());
    }
}
