<?php
/*
 * @author: ChenGuangHui
 */

namespace App\Contracts;

use Illuminate\Http\Request;

/**
 * @see https://learnku.com/articles/67827 日志系统
 * 
 * @author ChenGuangHui
 * @dateTime 2022-05-23
 */
interface LoggerInterface
{
    public function log($content);
}