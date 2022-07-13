<?php

namespace App\Http\Controllers\Address;


use App\Http\Controllers\Controller;
use App\Logic\Address\AddressLogic;
use Illuminate\Http\Request;

class AddressController extends Controller
{
  
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function lists(Request $request)
    {
        $pageData = lists_page($request->all());
        return (new AddressLogic())->lists($request->all(), $pageData);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function detail(Request $request)
    {
        $this->validate($request->all(), [
            'id' => 'required|integer',
        ]);
        return (new AddressLogic())->detail($request->all());
    }

    /**
     * 添加地址
     *
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function store(Request $request)
    {
        $this->validate($request->all(), [
            'province' => 'required|string',
            'city' => 'required|string',
            'region' => 'required|string',
            'contact' => 'required|string',
            'moblie' => 'required|string',
            'address' => 'required|string',
        ]);
        return (new AddressLogic())->store($request->all());
    }

    
    /**
     * 添加地址
     *
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function update(Request $request)
    {
        $this->validate($request->all(), [
            'id' => 'required|integer',
            'province' => 'required|string',
            'city' => 'required|string',
            'region' => 'required|string',
            'contact' => 'required|string',
            'moblie' => 'required|string',
            'address' => 'required|string',
        ]);
        return (new AddressLogic())->update($request->all());
    }

    /**
     * 删除地址
     *
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function delete(Request $request)
    {
        $this->validate($request->all(), [
            'id' => 'required|integer',
        ]);
        return (new AddressLogic())->delete($request->all());
    }
}
