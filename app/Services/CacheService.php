<?php
/*
 * @author: ChenGuangHui
 */

namespace App\Services;


use Illuminate\Support\Facades\Redis;

/**
 * @see https://blog.csdn.net/h330531987/article/details/79090555
 * Class Cache
 * @package App\Services
 */
class CacheService
{
    /**
     *  获取缓存
     * @return bool
     */
    public static function get($key)
    {
        if (!Redis::exists($key)) {
            return false;
        }

        return Redis::get($key);
    }

    /**
     * 设置缓存
     * @return mixed
     */
    public static function setex($key, $data, $expires = 60)
    {
        return Redis::setex($key, $expires, $data);
    }

    /**
     * 删除缓存
     * @return bool
     */
    public static function del($key)
    {
        if (empty($key) || $key == '*') { //防止清除全部缓存
            return true;
        }

        $keys = Redis::keys($key);

        return !empty($keys) ? Redis::del($keys) : true;
    }

    /**
     * 哈希列表缓存
     * @return mixed
     */
    public static function hmset($key, $data, $expires = 10)
    {
        return Redis::hmset($key, $data) && self::expire($key, $expires);
    }

    /**
     * 获取哈希所有数值缓存
     * @return mixed
     */
    public static function hgetall($key)
    {
        return Redis::hgetall($key);
    }

    /**
     * 获取哈希数值缓存
     * @return mixed
     */
    public static function hmget($key, $data)
    {
        return Redis::hmget($key, $data);
    }

    /**
     * 设置缓存有效期
     * @return mixed
     */
    public static function expire($key, $expires = 10)
    {
        return Redis::expire($key, $expires) && self::ttl($expires);
    }

    /**
     * 获取剩余的有效期值
     * @return mixed
     */
    public static function ttl($key)
    {
        return Redis::ttl($key);
    }
}
