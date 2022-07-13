<?php


namespace App\Logic\ShopCart;


use App\Logic\Logic;
use App\Models\Address;
use App\Models\Cart;
use App\Models\Coupon;
use App\Models\Goods;
use App\Models\GoodsSku;
use App\Models\GoodsSpec;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;

class ShopCartLogic extends Logic
{
    /**
     * @param array $where
     * @param array $pageData
     * @param array $sortData
     */
    public function lists($where = [], $pageData = ['pageSize' => 10, 'pageNow' => 1], $sortData = [])
    {
        $data = Cart::query()
            ->where('uid', auth('api')->id())
            ->when(isset($where['status']), function (Builder $query) use ($where) {
                $query->where('status', $where['status']);
            })
            ->when(!empty($where['name']), function (Builder $query) use ($where) {
                $query->where('name', 'like', '%' . $where['name'] . '%');
            })->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        $ids = explode(',', implode(',', array_column($data["data"], 'spec_sku_id')));
        $goodsSpec = GoodsSpec::query()->with('SpecValue')->whereIn('id', array_unique($ids))->get()->toArray();
        $spec_value = array_column($goodsSpec, 'spec_value', 'id');
        foreach($data["data"] as &$item){
            $sku_name = '';
            if (!empty($item["spec_sku_id"])) {
                foreach(explode(",", $item["spec_sku_id"]) as $id){
                    $sku_name .= $spec_value[$id]['spec_value'] . ';';
                }
            }
            
            $item['sku_name'] = rtrim($sku_name, ';');
        }

        return lists($data);
    }

    /**
     * Undocumented function
     *
     * @param [type] $params
     * @return void
     */
    public function store($params)
    {
        $cart = Cart::query()->where('uid', auth('api')->id())->where('goods_id', $params['goods_id'])
            ->when(isset($params['sku_id']), function($query) use($params){
                $query->where('spec_sku_id', $params['sku_id']);
            })->first();

        if(!empty($cart)){
            $resuful = Cart::query()->where('id', $cart->id)->update(['number' => $cart->number + $params['number']]);
            return $resuful ? success() : error();
        }

        $goods = Goods::query()->where('goods_id', $params['goods_id'])->first();
        abort_unless($goods, 500, '商品不存在');
        $goods = $goods->toArray();
        // 检测库存
        if(isset($params['sku_id']) && !empty($params['sku_id'])){
            $goodsSku = GoodsSku::query()->where('goods_id', $params['goods_id'])->where('spec_sku_id', $params['sku_id'])->first();
            abort_unless($goodsSku, 500, '商品规格异常！');
            $goodsSku = $goodsSku->toArray();
            abort_if($goodsSku['stock_num'] < $params['number'], 500, '库存不足');
        } else {
            abort_if($goods['stock_num'] < $params['number'], 500, '库存不足');
        }

        $data = array(
            'uid' => auth('api')->id(),
            'number' => $params['number'],
            'goods_id' => $params['goods_id'],
            'goods_name' => $goods['goods_name'],
            'spec_sku_id' => $params['sku_id'] ?? '',
            'goods_thumb' => $goodsSku['goods_thumb'] ?? Arr::first(array_column(json_decode($goods['goods_thumb'], true), 'url')),
            'goods_no' => $goodsSku['goods_no'] ?? $goods['goods_id'],
            'goods_price' => $goodsSku['goods_price'] ?? $goods['goods_price'],
            'line_price' => $goodsSku['line_price'] ?? $goods['line_price'],
        );
        $resuful = Cart::query()->create($data);
        return $resuful ? success() : error();
    } 

    /**
     * 更新购物车
     *
     * @param [type] $params
     * @return void
     */
    public function update($params)
    {
        $cart = Cart::query()->where('uid',auth('api')->id())->where('id', $params['id'])->first();
        abort_unless($cart, 500, '商品不存在');
        $resuful = Cart::query()->where('uid',auth('api')->id())->where('id', $params['id'])->update(['number' => $params['number']]);
        return $resuful ? success() : error();
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-27
     * @param  [type] $params
     */
    public function info($params)
    {
        $goodsIds = $feightIds = array();
        $post_fee = 0;
        if(isset($params['cart_ids']) && !empty($params['cart_ids'])){
            $info = Cart::query()->where('uid',auth('api')->id())->whereIn('id', explode(',', $params['cart_ids']))->get()->toArray();
            abort_unless($info, 500, '商品不存在');
                    
            $ids = explode(',', implode(',', array_column($info, 'spec_sku_id')));
            $goodsSpec = GoodsSpec::query()->with('SpecValue')->whereIn('id', array_unique($ids))->get()->toArray();
            $spec_value = array_column($goodsSpec, 'spec_value', 'id');
            foreach($info as &$item){
                $goods = Goods::query()->where('goods_id', $item['goods_id'])->where('status', 1)->first();
                abort_if(empty($goods), 500, '商品状态异常');
                $sku_name = '';
                if (!empty($item["spec_sku_id"])) {
                    foreach(explode(",", $item["spec_sku_id"]) as $id){
                        $sku_name .= $spec_value[$id]['spec_value'] . ';';
                    }
                }
                $goodsIds[] = $item["goods_id"];
                $feightIds[] = $goods["feight_template_id"];
                $item['sku_name'] = rtrim($sku_name, ';');
            }
        } else {
            $goods = Goods::query()->where('goods_id', $params['goods_id'])->first();
            abort_unless($goods, 500, '商品不存在');
            $goods = $goods->toArray();
            $goodsIds[] = $goods["goods_id"];
            $feightIds[] = $goods["feight_template_id"];
            if (isset($params['sku_id']) && !empty($params['sku_id'])) {
                $sku_name = '';
                $goodsSpec = GoodsSpec::query()->with('SpecValue')->whereIn('id', explode(',', $params['sku_id']))->get()->toArray();
                $spec_value = array_column($goodsSpec, 'spec_value', 'id');
                foreach(explode(",", $params['sku_id']) as $id){
                    $sku_name .= $spec_value[$id]['spec_value'] . ';';
                }
                $goodsSku = GoodsSku::query()->where('goods_id', $params['goods_id'])->where('spec_sku_id', $params['sku_id'])->first();
                abort_unless($goodsSku, 500, '商品规格异常！');
                $info[0] = array_merge($goodsSku->toArray(), array(
                    'sku_name' => rtrim($sku_name, ';'),
                    'goods_name' => $goods['goods_name']
                ));
                $info[0]['sku_id'] = $params['sku_id'];
                $info[0]['sku_name'] = rtrim($sku_name, ';');
            } else{
                $info[0] = $goods;
                $info[0]['goods_thumb'] = Arr::first(array_column(json_decode($info[0]['goods_thumb'], true), 'url'));
            }
            $info[0]['number'] = $params['number'];
        }

        if (isset($params['address_id']) && !empty($params['address_id'])) {
            $address = Address::query()->where('uid',auth('api')->id())->where('id', $params['address_id'])->first();
        } else {
            $address = Address::query()->where('uid',auth('api')->id())->where('is_default', 1)->first();
        }
        
        // 优惠券查询
        $coupon = Coupon::query()->whereHas('couponUser', function($query){
            $query->where('status', 0)->where('uid', auth('api')->id());
        })->where('status', 2)->whereRaw("SUBSTRING_INDEX(SUBSTRING_INDEX(`ref_ids`, ',' , 1), '_' , -2) IN ('" . implode("','", $goodsIds) . "')")->get();
        
        // $freight = Freight::query()->whereIn('id', $post_fee)->get();
        $data = array(
            'goods_info' => $info,
            'address_info' => $address,
            'coupon' => $coupon,
            'post_fee'=> $post_fee
        );
        return data($data);
    }

    /**
     * 删除购物车
     *
     * @param [type] $params
     * @return array
     */
    public function delete($params)
    {
        $cart = Cart::query()->where('uid',auth('api')->id())->where('id', $params['id'])->first();
        abort_unless($cart, 500, '购物车不存在');
        $result =  Cart::query()->where('uid',auth('api')->id())->where('id', $params['id'])->delete();
        return $result ? success() : error();
    }
}
