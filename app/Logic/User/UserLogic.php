<?php
/*
 * @author: ChenGuangHui
 */

namespace App\Logic\User;

use App\Logic\Logic;
use App\Models\MemberLevel;
use App\Models\MemberUseful;
use App\Models\Order;
use App\Models\PointRecord;
use App\Models\User;
use Illuminate\Database\Eloquent\Builder;

class UserLogic extends Logic
{

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  [type] $params
     */
    public function personal($params)
    {
        $user = User::query()->where('uid', auth('api')->id())->first();
        abort_if(empty($user), 500, '用户异常！请联系客服！');
        $order = Order::query()->where('uid', auth('api')->id())->get();
        $orderInfo = array();
        for ($i = 1; $i <= 4; $i++) {
            $number = 0;
            if ($i == 1) {
                $number = collect($order)->where('status', Order::WAIT_PAID_ORDER)->count();
            } elseif ($i == 2) {
                $number = collect($order)->whereIn('status', [Order::SUCCESS_PAID_ORDER, Order::WAIT_SHIPPED_ORDER])->count();
            } elseif ($i == 3) {
                $number = collect($order)->where('status', Order::HAVE_SHIPPED_ORDER)->count();
            } else {
                $number = 0;
            }
            $orderInfo[] = array(
                'type' => $i,
                'number' => $number
            );
        }
        $data = array(
            'user' => $user,
            'order' => $orderInfo
        );
        return data($data);
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  [type] $params
     */
    public function member($params)
    {
        $user = User::query()->where('uid', auth('api')->id())->first();
        abort_if(empty($user), 500, '用户异常,请联系客服！');
        $member = MemberLevel::query()->where('reach_growth', '<=', $user->growth)->where('status', 1)->get()->max()->toArray();
        abort_if(empty($member), 500, '用户会员等级异常，请联系客服！');
        $useful = MemberUseful::query()->whereIn('id', explode(',', $member['useful_ids']))->where('status', 1)->get();
        foreach ($useful as &$item) {
            $item['icon'] = json_decode($item['icon'], true);
        }
        $data = array(
            'user' => $user,
            'privilege' => $useful
        );
        return data($data);
    }

    /**
     * 积分流水
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-20
     * @param array $where
     * @param array $pageData
     * @param array $sortData
     */
    public function point($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = PointRecord::query()
            ->where('uid', auth('api')->id())
            ->orderBy('id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        return lists($data);
    }


    /**
     * 成长值流水
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-20
     * @param array $where
     * @param array $pageData
     * @param array $sortData
     */
    public function growth($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = PointRecord::query()
            ->where('uid', auth('api')->id())
            ->orderBy('id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        return lists($data);
    }
}
