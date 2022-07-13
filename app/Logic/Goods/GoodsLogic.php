<?php

namespace App\Logic\Goods;


use App\Logic\Logic;
use App\Models\BlindBox;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Comment;
use App\Models\Coupon;
use App\Models\CouponUser;
use App\Models\Goods;
use App\Models\GoodsSpec;
use App\Models\Order;
use App\Models\OrderGoods;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class GoodsLogic extends Logic
{
    /**
     * @param array $where
     * @param array $pageData
     * @param array $sortData
     */
    public function lists($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = Goods::query()
            ->where('status', 1)
            ->when(!empty($where['goods_type']), function (Builder $query) use ($where) {
                $query->where('goods_type', $where['goods_type']);
            })
            ->when(!empty($where['category_id']), function (Builder $query) use ($where) {
                $goodsIds = Category::query()->where('id', $where['category_id'])->value('goods_ids');
                $query->whereIn('goods_id', explode(',', $goodsIds));
            })
            ->when(!empty($where['keyword']), function (Builder $query) use ($where) {
                $query->where('goods_name', 'like', '%' . $where['keyword'] . '%');
            })
            ->orderBy('sort', 'desc')
            ->orderBy('goods_id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        foreach ($data['data'] as &$item) {
            $item['goods_thumb'] = Arr::first(array_column(json_decode($item['goods_thumb'], true), 'url'));
            $item['has_coupon'] = false;
        }

        return lists($data);
    }

    /**
     * 商品分类
     *
     * @param [type] $params
     * @return array
     */
    public function category($params)
    {
        $data = Category::query()
            ->when(isset($params['keyword']), function ($query) use ($params) {
                $query->where('name', 'like', '%' . $params['keyword'] . '%');
            })->where('status', 1)->get();

        $primary = collect($data)->where('parent_id', 0)->keyBy('id')->toArray();
        foreach ($primary as $k => $v) {
            $child = collect($data)->where('parent_id', $v['id'])->all();
            if (empty($child)) {
                unset($primary[$k]);
            }
        }
        $minor = collect($data)->where('parent_id', '<>', 0)->groupBy('parent_id')->toArray();
        $minorData = array();
        foreach ($minor as $key => $item) {
            foreach ($item as &$val) {
                $val['thumb'] = Arr::first(array_column(json_decode($val['thumb'], true), 'url'));
            }
            if (isset($primary[$key])) {
                $minorData[] = [
                    'id' => $key,
                    'name' => $primary[$key]['name'],
                    'data' => $item
                ];
            }
        }
        return data([
            'primary' => array_values($primary),
            'minor' => array_values($minorData)
        ]);
    }

    /**
     * 商品详情
     * 
     * @param [type] $params
     * @return void
     */
    public function detail($params)
    {
        $data = Goods::query()->with(['goodsSku', 'goodsSpec'])->where('goods_id', $params['goods_id'])->first();
        abort_unless($data, 500, '商品不存在');
        abort_if($data->status <> 1, 500, '商品已下架');
        $goods = $data->toArray();
        $thumb = json_decode($goods['goods_thumb'], true);
        foreach($thumb as &$item){
            $item['type'] = 'image';
        }
        
        $video = json_decode($goods['goods_video'], true);
        if (!empty($video)) {
            foreach($video as &$item){
                $item['type'] = 'video';
            }
            array_unshift($thumb, $video);
        }
        $goods['goods_thumb'] = $thumb;

        $sku = GoodsSpec::query()->with(['spec', 'specValue'])->where('goods_id', $params['goods_id'])->get()->toArray();

        $skuInfo = array();
        foreach (array_column($sku, 'spec') as $item) {
            $specData = array_values(collect(array_column($sku, 'spec_value'))->where('spec_id', $item['id'])->toArray());
            foreach ($specData as &$spec) {
                $spec['checked'] = false;
            }
            $skuInfo[$item['id']] = array_merge($item, [
                'spec_value' => $specData
            ]);
        }
        $goods['sku_info'] = array_values($skuInfo) ?? [];
        $goods['carts_count'] = Cart::query()->where('uid', auth('api')->id())->count();
        // 优惠券列表
        // $coupon = Coupon::query()->where('status', 1)->whereRaw("FIND_IN_SET(" . $params['goods_id'] . ", 'ref_ids')")->get()->toArray();
        $coupon = Coupon::query()->where('status', 1)->get()->toArray();
        // $couponUser = CouponUser::query()->where('uid', auth('api')->id())->whereIn('coupon_id', array_column($coupon, 'id'))->get()->keyBy('coupon_id')->toArray();
        // foreach ($coupon as &$item) {
        //     if (isset($couponUser[$item["id"]]) && count($couponUser[$item["id"]]) >= $item['repeat_quantity']) {
        //         $item['status'] = 4;
        //     }
        // }
        $goods['coupon'] = $coupon ?? [];
        $goods['comment'] = Comment::query()->where('goods_id', $params['goods_id'])->where('status', 1)->get();
        return data($goods);
    }

    /**
     * 优惠券列表
     *
     * @param array $where
     * @param array $pageData
     * @param array $sortData
     * @return void
     */
    public function coupon($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = CouponUser::query()
            ->where('uid', auth('api')->id())
            ->when(isset($where['status']), function ($query) use ($where) {
                $query->where('status', $where["status"]);
            })
            ->orderBy('id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        return lists($data);
    }

    /**
     * 领取优惠券
     *
     * @param [type] $params
     * @return void
     */
    public function getCoupon($params)
    {
        $data = Coupon::query()->where('id', $params['coupon_id'])->first();
        abort_unless($data, 500, '优惠券不存在！');
        abort_if($data->status !== 1, 500, '优惠券不可用！');
        $coupon = $data->toArray();
        $couponUser = CouponUser::query()->where('uid', auth('api')->id())->where('coupon_id', $coupon['id'])->get();
        abort_if($coupon["repeat_quantity"] <= count($couponUser), 500, "已超过领取数量！");
        
        $data = array(
            'uid' => auth('api')->id(),
            'coupon_id' => $coupon['id'],
            'name' => $coupon['name'],
            'remark' => $coupon['remark'],
            'code_no' => Str::random(8),
            'coupon_type' => $coupon['coupon_type'],
            'coupon_amount' => $coupon['coupon_amount'],
            'full_amount' => $coupon['full_amount'],
            'remark' => $coupon['remark'],
            'effective_start_time' => $coupon['effective_start_time'],
            'effective_end_time' => $coupon['effective_end_time'],
        );
        $result = CouponUser::query()->create($data);
        return $result ? success() : error();
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-06-18
     * @param array $where
     * @param array $pageData
     * @param array $sortData
     */
    public function commentLists($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = Comment::query()
            ->where('goods_id', $where["goods_id"])
            ->when(isset($where['status']), function ($query) use ($where) {
                $query->where('status', $where["status"]);
            })
            ->orderBy('id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        return lists($data);
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-24
     * @param  [type] $params
     */
    public function comment($params)
    {
        $data = Order::query()->where('uid', auth('api')->id())->where('order_id', $params['order_id'])->first();
        abort_unless($data, 500, '订单不存在！');
        $goods = OrderGoods::query()->where('id', $params['order_goods_id'])->first();
        abort_unless($goods, 500, '订单不存在！');
        abort_if($data->buyer_rate == 1, 500, '该商品订单已评！');

        $data = array(
            'uid' => auth('api')->id(),
            'goods_id' => $goods['goods_id'],
            'order_no' => $data['order_no'],
            'order_goods_id' => $goods['id'],
            'goods_name' => $goods['goods_name'],
            'sku' => $goods['sku'] ?? '',
            'goods_thumb' => $goods['goods_thumb'],
            'num' => $goods['num'],
            'picture' => $params['picture'] ?? '',
            'member_name' => auth('api')->user()->nickname,
            'member_icon' => auth('api')->user()->avatar_url,
            'comment_rank' => $params['comment_rank'],
        );
        $result = Comment::query()->create($data);
        return $result ? success() : error();
    }
}
