<?php

namespace App\Logic\Home;


use App\Models\Activity;
use App\Models\Advert;
use App\Models\Help;
use App\Logic\Logic;
use App\Support\Facades\Rpc;
use Illuminate\Support\Arr;

class HomeLogic extends Logic
{
    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function lists($params)
    {
        $advert = Advert::query()
            ->where('status', 1)
            ->where(function ($query) {
                $query->where('type', 1)->orWhere(function ($item) {
                    $item->where('start_time', '<=', date('Y-m-d H:i:s'))->where('end_time', '>', date('Y-m-d H:i:s'));
                });
            })
            ->get()
            ->toArray();

        foreach ($advert as &$item) {
            $item['thumb'] = Arr::first(array_column(json_decode($item['thumb'], true), 'url'));
        }

        $list = array(
            'poster' => array_values(collect($advert)->where('module', 1)->toArray()),
            'banner' => array_values(collect($advert)->where('module', 2)->toArray()),
            'recommend' => array_values(collect($advert)->where('module', 3)->toArray())
        );
        return data($list);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function activity($params)
    {
        $activity = Activity::query()->where('status', 1)->orderByDesc('sort')->get();
        foreach ($activity as &$item) {
            $item['thumb'] = Arr::first(array_column(json_decode($item['thumb'], true), 'url'));
        }
        return lists($activity, false);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public function share($params)
    {
        $data = Advert::query()->where('status', 1)->first();
        return empty($data) ? error() : data($data);
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  [type] $params
     */
    public function help($params)
    {
        $data = Help::query()->with('children')->where('parent_id', 0)->where('status', 0)->get();
        return data($data);
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     * @param  [type] $params
     */
    public function tenant($params)
    {
        $rpc = Rpc::getClient();
        $domain = "xxasd";
        $data = $rpc->getTenantInit($domain);
        return data($data);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function resolve($params)
    {
        if ($params['module'] == 'blind_box') {
            $data = array();
            $module = 'protocol.blind_box';

        } else {
            $data = array(
                'name' => '云淘趣',
                'title' => '云淘趣（广州）网络科技有限公司',
            );

            $module = 'protocol.' . $params["type"];
        }
        
        return view($module, $data);
    }
}
