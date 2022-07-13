<?php

if (!function_exists('success')) {
    /**
     * 返回成功的json数组
     * @param string $msg
     * @param string $statusCode
     * @return \Illuminate\Http\JsonResponse
     */
    function success($msg = '操作成功', $statusCode = 200)
    {
        $result = [
            'message' => $msg,
            'statusCode' => $statusCode,
        ];
        return Response::json($result);
    }
}

if (!function_exists('error')) {
    /**
     * 返回失败的json数组
     * @param string $msg
     * @param int $statusCode
     * @return \Illuminate\Http\JsonResponse
     */
    function error($msg = '操作失败!', $statusCode = 302)
    {
        $result = [
            'message' => $msg,
            'statusCode' => $statusCode,
        ];
        return Response::json($result);
    }
}

if (!function_exists('data')) {
    function data($data = [], $statusCode = 200, $message = '操作成功')
    {
        $result = [
            'message' => $message,
            'statusCode' => $statusCode,
            'data' => $data,
        ];
        return Response::json($result);
    }
}


if (!function_exists('lists_page')) {
    /**
     * 获取翻页的数据
     *
     * @param array $request
     * @param int $defaultSize
     * @param int $defaultNum
     * @return array|int[]
     */
    function lists_page($request = [], $defaultSize = 10, $defaultNum = 1)
    {
        $pageNum = $defaultNum;

        if (isset($request['pageNow'])) {
            $pageNum = $request['pageNow'];
        }
        if (isset($request['pageNum'])) {
            $pageNum = $request['pageNum'];
        }
        return array(
            'pageNow' => $pageNum,
            'pageSize' => isset($request['pageSize']) ? $request['pageSize'] : $defaultSize
        );
    }
}


if (!function_exists('get_ip')) {
    /**
     * 获取当前Ip
     *
     * @return array|false|mixed|string
     */
    function get_ip()
    {
        //判断服务器是否允许$_SERVER
        if (isset($_SERVER)) {
            if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                $realIp = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
                $realIp = $_SERVER['HTTP_CLIENT_IP'];
            } else {
                $realIp = $_SERVER['REMOTE_ADDR'];
            }
        } else {
            //不允许就使用getenv获取
            if (getenv("HTTP_X_FORWARDED_FOR")) {
                $realIp = getenv("HTTP_X_FORWARDED_FOR");
            } elseif (getenv("HTTP_CLIENT_IP")) {
                $realIp = getenv("HTTP_CLIENT_IP");
            } else {
                $realIp = getenv("REMOTE_ADDR");
            }
        }

        return $realIp;
    }
}


if (!function_exists('lists')) {
    /**
     * @param array $data
     * @param bool $isPage
     * @param int $statusCode
     * @param string $message
     * @return \Illuminate\Http\JsonResponse
     */
    function lists($data = [], $isPage = true, $statusCode = 200, $message = '操作成功')
    {
        $result = [
            'statusCode' => $statusCode,
            'message' => $message,
            'lists' => $isPage ? $data['data'] : $data,
        ];

        if ($isPage) {
            $result = array_merge($result, array(
                'page' => array(
                    'now' => $data['current_page'],
                    'size' => $data['per_page'],
                    'count' => $data['total'],
                    'list_id' => $data['list_id'] ?? '',
                )
            ));
        }

        return Response::json($result);
    }
}

if (!function_exists('convertUnderline')) {
    function convertUnderline($str)
    {
        $strs = [];
        foreach ($str as $item) {
            $strs[] = preg_replace_callback('/([-_]+([a-z]{1}))/i', function ($matches) {
                return strtoupper($matches[2]);
            }, $item);
        }
        return $strs;
    }
}

if (!function_exists('humpToLine')) {
    function humpToLine($str)
    {
        $strs = [];
        foreach ($str as $item) {
            $strs[] = preg_replace_callback('/([A-Z]{1})/', function ($matches) {
                return '_' . strtolower($matches[0]);
            }, $item);
        }

        return $strs;
    }
}

if (!function_exists('uncamelize')) {
    function uncamelize($camelCaps, $separator = '_')
    {
        return strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . $separator . "$2", $camelCaps));
    }
}


if (!function_exists('format_mobile')) {
    /**
     * 格式化手机号
     */
    function format_mobile($mobile)
    {
        if (empty($mobile)) {
            return '';
        }
        return substr($mobile, 0, 3) . "****" . substr($mobile, -4, strlen($mobile));
    }
}


if (!function_exists('get_client_ip')) {
    /**
     * 获取客户端ip
     */
    function get_client_ip($type = 0)
    {
        $type = $type ? 1 : 0;
        static $ip = null;
        if ($ip !== null) {
            return $ip[$type];
        }

        if (isset($_SERVER['HTTP_X_REAL_IP']) && !empty($_SERVER['HTTP_X_REAL_IP'])) { //nginx 代理模式下，获取客户端真实IP
            $ip = $_SERVER['HTTP_X_REAL_IP'];
        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) { //客户端的ip
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) { //浏览当前页面的用户计算机的网关
            $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $pos = array_search('unknown', $arr);
            if (false !== $pos) {
                unset($arr[$pos]);
            }

            $ip = trim($arr[0]);
        } elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1'; //浏览当前页面的用户计算机的ip地址
        } else {
            $ip = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';
        }
        // IP地址合法验证
        $long = sprintf("%u", ip2long($ip));
        $ip = $long ? array($ip, $long) : array('0.0.0.0', 0);
        return $ip[$type];
    }
}

if (!function_exists('http_req')) {
    /**
     * curl 请求
     *
     * @param $method
     * @param $url
     * @param $data
     * @param array $request
     * @return \Illuminate\Http\JsonResponse|mixed
     */
    function http_req($method, $url, $data, $request = [])
    {
        $curl = curl_init();

        if (stripos($url, "https://") !== false) {
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        }

        if ($method == 'POST') {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
        } else {
            $url = $url . '?' . $data;
        }

        curl_setopt($curl, CURLOPT_HTTPHEADER, $request);

        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);//超时时间

        $result = curl_exec($curl);
        //http status
        $CURLINFO_HTTP_CODE = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        //关闭,释放资源
        curl_close($curl);
        //如果返回的不是200,请参阅错误码 https://help.aliyun.com/document_detail/43906.html
        if ($CURLINFO_HTTP_CODE == 200) {
            return json_decode($result, true);
        } elseif ($CURLINFO_HTTP_CODE == 403) {
            return error('剩余次数不足', $CURLINFO_HTTP_CODE);
        } elseif ($CURLINFO_HTTP_CODE == 400) {
            return error('APP_CODE错误', $CURLINFO_HTTP_CODE);
        } else {
            return error('请求异常！', $CURLINFO_HTTP_CODE);
        }
    }
}
