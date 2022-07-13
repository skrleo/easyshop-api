<?php


namespace App\Logic\Home;


use App\Models\Lexicon;
use App\Logic\Logic;
use Illuminate\Support\Facades\Redis;
use Str;

class SearchLogic extends Logic
{
    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function lists($params)
    {
        $data = array('history' => [], 'suggest' => []);
        if (auth('api')->check()) {
            $key = "goods:SearchRecord:" . auth('api')->id();
            if (Redis::exists($key)) {
                $data = Redis::zrevrangebyscore($key, PHP_INT_MAX, 0, ['withscores' => true, 'limit' => [0, 10]]);
                $history = array();
                foreach (array_flip($data) as $k => $v){
                    $history[] = Str::limit($v, 16);
                }
            }

            $data['history'] = $history ?? [];
        }
        // 搜索推荐内容
        $data['suggest'] = Lexicon::query()->where('key', 'suggest')->where('status', 1)->get()->toArray();
        return data($data);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function store($params)
    {
        if (auth('api')->check()) {
            Redis::zadd("goods:SearchRecord:" . auth('api')->id(), time(), $params['keyword']);
        }
        return success();
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public static function destroy($params)
    {
        if (auth('api')->check()) {
            if (isset($params['keyword'])) {
                Redis::zrem("goods:SearchRecord:" . auth('api')->id(), $params['keyword']);
            } else {
                Redis::zremrangebyscore("goods:SearchRecord:" . auth('api')->id(), 0, PHP_INT_MAX);
            }
            return success();
        }
        return error();
    }
}
