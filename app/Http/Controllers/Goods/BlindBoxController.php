<?php
namespace App\Http\Controllers\Goods;


use App\Http\Controllers\Controller;
use App\Logic\Goods\BlindBoxLogic;
use Illuminate\Http\Request;
use App\Services\Payment\FreightService;

class BlindBoxController extends Controller
{
    
    /**
     * 盲盒列表
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-09
     * @param  Request $request
     */
    public function lists(Request $request)
    {
        return (new BlindBoxLogic())->lists($request->all(), lists_page($request->all()));
    }
    
    /**
     * 盲盒详情
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function detail(Request $request)
    {
        $this->validate($request->all(), [
            'id' => 'required|integer',
        ]);
        return (new BlindBoxLogic())->detail($request->all());
    }

    /**
     * 开盲盒
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-11
     * @param Request $request
     */
    public function open(Request $request)
    {
        $this->validate($request->all(), [
            'box_id' => 'required|integer|min:1'
        ]);
        // 创建订单
        $className = '\\App\\Services\\Payment\\BlindBoxService';

        abort_unless(class_exists($className), 500, '创建订单失败');

        $data = $className::getInstance($request->all())->create()->startPay();

        return data($data);
    }

    /**
     * 盲盒详情
     *
     * @param Request $request
     * @return void
     */
    public function prize(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer|min:1'
        ]);
        
        return (new BlindBoxLogic())->prize($request->all());
    }

    /**
     * 提取盲盒
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-17
     * @param Request $request
     */
    public function draw(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer|min:1',
            'address_id' => 'required|integer|min:1'
        ]);

        $data = FreightService::getInstance($request->all())->create()->startPay();
        return data($data);
    }


    /**
     * 我的盒柜
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-10
     * @param Request $request
     */
    public function order(Request $request)
    {
        $this->validate($request->all(), [
            'status' => 'integer|min:1',
        ]);
        return (new BlindBoxLogic())->order($request->all(), lists_page($request->all()));
    }
}