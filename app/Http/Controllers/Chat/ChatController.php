<?php


namespace App\Http\Controllers\Chat;


use App\Http\Controllers\Controller;
use App\Logic\Chat\ChatLogic;
use Illuminate\Http\Request;

class ChatController extends Controller
{
    /**
     * 获取消息列表
     *
     * @param Request $request
     * @return mixed
     */
    public function lists(Request $request)
    {
        return (new ChatLogic())->lists($request->all(), lists_page($request->all()));
    }
}
