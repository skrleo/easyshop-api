<?php

namespace App\Logic\Address;


use App\Logic\Logic;
use App\Models\Address;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Pagination\LengthAwarePaginator;

class AddressLogic extends Logic
{
    
    /**
     * @param array $where
     * @param int[] $pageData
     * @param array $sortData
     * @return \Illuminate\Http\JsonResponse
     */
    public function lists($where = [], $pageData = ['pageSize' => 20, 'pageNow' => 1], $sortData = [])
    {
        $data = Address::query()
            ->where('uid', auth('api')->id())
            ->when(!empty($where['name']), function (Builder $query) use ($where) {
                $query->where('name', 'like', '%' . $where['name'] . '%');
            })
            ->orderBy('id', 'desc')
            ->paginate($pageData['pageSize'], ['*'], 'page', $pageData['pageNow'])->toArray();

        return lists($data);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public function detail($params)
    {
        $data = Address::query()->where('uid', auth('api')->id())->where('id', $params['id'])->first();
        abort_unless($data, 404, '地址不存在！');
        $data->is_default = $data->is_default == 1 ? true : false;
        return data($data);
    }
    
    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public function store($params)
    {
        $data = array(
            'uid' => auth('api')->id(),
            'province' => $params['province'],
            'city' => $params['city'],
            'region' => $params['region'],
            'contact' => $params['contact'],
            'moblie' => $params['moblie'],
            'address' => $params['address'],
            'is_default' => $params['is_default'] ? 1 :  0,
        );
        if ($params['is_default']) {
            Address::query()->where('uid', auth('api')->id())->where('is_default', 1)->update(["is_default" => 0]);
        }
        $resuful = Address::query()->create($data);
        return $resuful ? success() : error();
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-27
     * @param  [type] $params
     */
    public function update($params)
    {
        $data = Address::query()->where('uid', auth('api')->id())->where('id', $params['id'])->first();
        abort_unless($data, 404, '地址不存在！');
        $data = array(
            'uid' => auth('api')->id(),
            'province' => $params['province'],
            'city' => $params['city'],
            'region' => $params['region'],
            'contact' => $params['contact'],
            'moblie' => $params['moblie'],
            'address' => $params['address'],
            'is_default' => $params['is_default'] ? 1 : 0,
        );
        if ($params['is_default']) {
            Address::query()->where('uid', auth('api')->id())->where('is_default', 1)->update(["is_default" => 0]);
        }
        $resuful = Address::query()->where('uid', auth('api')->id())->where('id', $params['id'])->update($data);
        return $resuful ? success() : error();
    }

    /**
     * 删除地址
     *
     * @param [type] $params
     * @return void
     */
    public function delete($params)
    {
        $data = Address::query()->where('uid', auth('api')->id())->where('id', $params['id'])->first();
        abort_unless($data, 500, '地址不存在！');
        $resuful = Address::query()->where('uid', auth('api')->id())->where('id', $params['id'])->delete();
        return $resuful ? success() : error();
    }
}
