<?php
/**
 * Created by PhpStorm.
 * User: chen
 * Date: 2020/7/5
 * Time: 0:51
 */

namespace App\Logic;


use App\Models\AdminLog;
use DB;
use Illuminate\Support\Facades\Request;

class Logic
{
    public function getOperationSqlStart()
    {
        DB::enableQueryLog();
    }

    /**
     * @return string
     */
    public function getOperationSqlEnd()
    {
        $queries = DB::getQueryLog();
        $a = end($queries);
        $tmp = str_replace('?', '"' . '%s' . '"', $a["query"]);
        return vsprintf($tmp, $a['bindings']);
    }

    /**
     * 记录操作日志
     *
     * @param int $type
     * @param string $sql
     * @param string $remark
     * @param string $log_url
     * @param int $uid
     * @param string $name
     * @return bool
     */
    public function actionLog($type = 0, $sql = '', $remark = '', $log_url = '', $uid = 0, $name = '')
    {
        if ($sql) {
            // 语句太长了,这样中文会有乱码
            $sql = mb_substr($sql, 0, 500, 'utf-8');
        }
        $add = array(
            'log_uid' => $uid ? $uid : auth('api')->id(),
            'log_username' => $name ? $name : auth('api')->user()->name,
            'log_type' => $type,
            'log_ip' => get_client_ip(),
            'log_sql' => $sql ? $sql : '',
            'log_remark' => $remark,
            'log_url' => $log_url ? $log_url : request()->route()->getPrefix() . "/" . request()->route()->getActionMethod(),
            'created_at' => date('Y-m-d H:i:s')
        );
        return AdminLog::query()->insert($add);
    }

    /**
     * 修正图片/链接地址格式
     *
     * @param $url
     * @return string
     */
    public function fix_url($url)
    {
        if (empty($url)) {
            return '';
        }

        $match = '/^[a-zA-Z]+:\\/\\//';
        $result = preg_match($match, $url, $matches);
        if ($result == 1) {
            return $url;
        } else {
            return 'https:' . $url;
        }
    }

    /**
     * @param $length
     * @return string
     */
    public function randomStr($length)
    {
        $randomStr = "";
        $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        $codeAlphabet .= "0123456789";

        for ($i = 0; $i < $length; $i++) {
            $randomStr .= $codeAlphabet[mt_rand(0, strlen($codeAlphabet) - 1)];
        }
        return $randomStr;
    }

}
