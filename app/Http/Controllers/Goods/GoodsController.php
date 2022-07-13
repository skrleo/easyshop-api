<?php

namespace App\Http\Controllers\Goods;


use App\Http\Controllers\Controller;
use App\Logic\Goods\GoodsLogic;
use EasyWeChat\Factory;
use EasyWeChat\Kernel\Http\StreamResponse;
use Illuminate\Http\Request;
use Storage;

class GoodsController extends Controller
{
    /**
     * 商品列表
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function lists(Request $request)
    {
        return (new GoodsLogic())->lists($request->all(), lists_page($request->all()));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function detail(Request $request)
    {
        $this->validate($request->all(), [
            'goods_id' => 'required|integer',
        ]);
        return (new GoodsLogic())->detail($request->all());
    }
    
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function category(Request $request)
    {
        return (new GoodsLogic())->category($request->all());
    }

    /**
     * 海报合成
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     * @throws \EasyWeChat\Kernel\Exceptions\InvalidArgumentException
     * @throws \EasyWeChat\Kernel\Exceptions\RuntimeException
     */
    public function poster(Request $request)
    {
        $this->validate($request->all(), [
            'channel' => 'required|string',
            'sign_key' => 'required|string',
            'goods_id' => 'required|integer',
        ]);

        $config = [
            'app_id' => 'wx18de60cc2f0b2af4',
            'secret' => 'e1b2fcf261338d753b23080f22c471b1',
        ];
        $app = Factory::miniProgram($config);
        $params = array(
            'goods_id' => $request->input('goods_id'),
        );
        $response = $app->app_code->getUnlimit(http_build_query($params), [
            'page' => 'pages/goods/detail'
        ]);
        if ($response instanceof StreamResponse) {
            $file_url = $response->saveAs(storage_path('app/public/poster'), $request->input('sign_key') . '.png');
            return data(['path_url' => asset(Storage::disk('public')->url('poster/' . $file_url))]);
        }
        return error("海报合成失败！");
    }

    /**
     * 优惠券列表
     *
     * @param Request $request
     * @return void
     */
    public function coupon(Request $request)
    {   
        return (new GoodsLogic())->coupon($request->all(), lists_page($request->all()));
    }

    /**
     * 领取优惠券
     *
     * @param Request $request
     * @return void
     */
    public function reap(Request $request)
    {
        $this->validate($request->all(), [
            'coupon_id' => 'required|integer',
        ]);
        return (new GoodsLogic())->getCoupon($request->all());
    }

    /**
     * 评价列表
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-18
     * @param Request $request
     */
    public function commentLists(Request $request)
    {
        $this->validate($request->all(), [
            'goods_id' => 'required|integer',
        ]);
        return (new GoodsLogic())->commentLists($request->all(), lists_page($request->all()));
    }

    /**
     * 商品评价
     * 
     * @author ChenGuangHui
     * @dateTime 2022-05-24
     * @param  Request $request
     */
    public function comment(Request $request)
    {
        $this->validate($request->all(), [
            'order_id' => 'required|integer',
            'comment_rank' => 'required|integer',
            'order_goods_id' => 'required|integer',
        ]);
        return (new GoodsLogic())->comment($request->all());
    }
}
