<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'accepted' => ':attribute 必须是被接受的',
    'active_url' => ':attribute 必须是一个合法的 URL',
    'after' => ':attribute 必须是 :date 之后的一个日期',
    'after_or_equal' => ':attribute 必须是与 :date 相同或之后的一个日期',
    'alpha' => ':attribute 只能由字母组成',
    'alpha_dash' => ':attribute 只能由字母、数字和中划线组成',
    'alpha_num' => ':attribute 只能由字母和数字组成',
    'array' => ':attribute 必须是数组',
    'before' => ':attribute 必须是 :date 之前的一个日期',
    'before_or_equal' => ':attribute 必须是与 :date 相同或之前的一个日期',
    'between' => [
        'numeric' => ':attribute 必须在 :min 到 :max 之间',
        'file' => ':attribute 必须在 :min 到 :max KB之间',
        'string' => ':attribute 必须在 :min 到 :max 个字符之间',
        'array' => ':attribute 必须在 :min 到 :max 项之间',
    ],
    'boolean' => ':attribute 字符必须是 true 或 false',
    'confirmed' => ':attribute 二次确认不匹配',
    'date' => ':attribute 必须是一个合法的日期',
    'date_format' => ':attribute 与给定的格式 :format 不符合',
    'different' => ':attribute 必须不同于 :other',
    'digits' => ':attribute 必须是 :digits 位的数字',
    'digits_between' => ':attribute 必须在 :min 和 :max 位数字之间',
    'dimensions' => ':attribute 图片尺寸不正确',
    'distinct' => ':attribute 已经存在',
    'email' => ':attribute 必须是一个合法的电子邮件地址',
    'exists' => ':attribute 不存在',
    'file' => ':attribute 必须是文件',
    'filled' => ':attribute 不能为空',
    'image' => ':attribute 必须是图片',
    'in' => '选定的 :attribute 是无效的',
    'in_array' => ':attribute 没有在 :other 中',
    'integer' => ':attribute 必须是整数',
    'ip' => ':attribute 必须是有效的 IP 地址',
    'ipv4' => ':attribute 必须是有效的 IPV4 地址',
    'ipv6' => ':attribute 必须是有效的 IPV6 地址',
    'json' => ':attribute 必须是正确的 JSON 格式',
    'max' => [
        'numeric' => ':attribute 不能大于 :max',
        'file' => ':attribute 不能大于 :max KB',
        'string' => ':attribute 不能超过 :max 个字符',
        'array' => ':attribute 最多只有 :max 个单元',
    ],
    'mimes' => ':attribute 必须是一个 :values 类型的文件',
    'mimetypes' => ':attribute 必须是一个 :values 类型的文件',
    'min' => [
        'numeric' => ':attribute 必须大于等于 :min',
        'file' => ':attribute 大小不能小于 :min KB',
        'string' => ':attribute 至少为 :min 个字符',
        'array' => ':attribute 至少有 :min 个单元',
    ],
    'not_in' => '选定的 :attribute 是无效的',
    'numeric' => ':attribute 必须是数字',
    'present' => ':attribute 必须存在',
    'regex' => ':attribute 格式不正确',
    'required' => ':attribute 不能为空',
    'required_if' => '当 :other 为 :value 时 :attribute 不能为空',
    'required_unless' => '当 :other 不为 :value 时 :attribute 不能为空',
    'required_with' => '当 :values 存在时 :attribute 不能为空',
    'required_with_all' => '当 :values 都存在时 :attribute 不能为空',
    'required_without' => '当 :values 不存在时 :attribute 不能为空',
    'required_without_all' => '当 :values 都不存在时 :attribute 不能为空',
    'same' => ':attribute 和 :other 必须相同',
    'size' => [
        'numeric' => ':attribute 大小必须为 :size',
        'file' => ':attribute 大小必须为 :size KB',
        'string' => ':attribute 必须是 :size 个字符',
        'array' => ':attribute 必须为 :size 个单元',
    ],
    'string' => ':attribute 必须是一个字符串',
    'timezone' => ':attribute 必须是一个合法的时区值',
    'unique' => ':attribute 已经存在',
    'uploaded' => ':attribute 上传失败',
    'url' => ':attribute 格式不正确',
    'uuid' => ':attribute 必须是一个合法的 UUID',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
    */

    'attributes' => [
        'account' => '账号',
    ],

];
