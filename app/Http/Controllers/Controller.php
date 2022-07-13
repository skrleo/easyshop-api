<?php

namespace App\Http\Controllers;

use App\Exceptions\RJsonError;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Lang;
use Illuminate\Support\Facades\Validator;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * @see https://learnku.com/articles/54597
     * @see https://www.cnblogs.com/haiwei_sun/articles/9831171.html
     *
     * @param $request
     * @param $rules
     * @param array $attribute
     * @throws RJsonError
     */
    public function validate($request, $rules, $attribute = [])
    {
        $validator = \Validator::make($request, $rules, Lang::get("validation"), $attribute);
        if ($validator->fails()) {
            throw new RJsonError($validator->errors()->first(),402);
        }
    }
}
