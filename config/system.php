<?php

return array(
    'oss' => [
        //bucket 名称
        'bucket' => '',
        //地区是深圳oss
        'region' => 'cn-shenzhen',
        //bucket 地区的访问接口
        'endpoint' => 'http://oss-cn-shenzhen.aliyuncs.com',
        //默认cdn域名
        'urlRoot' => '',
        //阿里云的api 授权id
        'accessKeyId' => '',
        //阿里云的api 授权key
        'accessKeySecret' => '',
        //阿里云的api 授权角色
        'roleArn' => '',
        //生成授权信息的授权时间
        'tokenExpireTime' => '900',
        //是否使用endpoint
        'isCName' => false,
        'securityToken' => NULL
    ],
    'user' => [
        'wallet_secret' => env('USER_WALLET_SECRET')
    ]
);
