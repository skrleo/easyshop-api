<?php
/**
 * Created by PhpStorm.
 * User: chen
 * Date: 2020/7/9
 * Time: 21:37
 */

namespace App\Exceptions;

class RJsonError extends \Exception
{
    public function __construct($msg = '操作失败！', $statusCode = '400')
    {
        parent::__construct($msg, $statusCode);
    }
}