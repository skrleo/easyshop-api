<?php

namespace App\Exceptions;

use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param \Throwable $exception
     * @return void
     *
     * @throws \Exception
     */
    public function report(Throwable $exception)
    {
        parent::report($exception);
    }

    /**
     *
     * @see https://learnku.com/laravel/t/2460/embrace-exceptions-with-laravel
     * Render an exception into an HTTP response.
     *
     * @param \Throwable $e
     * @param \Illuminate\Http\Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws \Throwable
     */
    public function render($request, Throwable $e)
    {
        if ($e instanceof QueryException) {
            return response()->json([
                'message' => $e->getMessage(),
                'statusCode' => 403
            ]);
        }

        if ($e instanceof RJsonError || $e instanceof BindingResolutionException) {
            return response()->json([
                'message' => $e->getMessage(),
                'statusCode' => 300
            ]);
        }

        if ($e instanceof MethodNotAllowedHttpException) {
            return response()->json([
                'message' => "请求不存在！",
                'statusCode' => 404
            ]);
        }

        if ($e instanceof \Symfony\Component\HttpKernel\Exception\NotFoundHttpException) {
            return response()->json([
                'message' => "请求不存在！",
                'statusCode' => 404
            ]);
        }


        if (request()->segment(1) == 'api') {
            switch (true) {
                case $e instanceof UnauthorizedHttpException:
                    return response()->json([
                        'statusCode' => 401,
                        'message' => '登陆已过期，请重新登陆'
                    ]);

                case $e instanceof NotFoundHttpException:
                    return response()->json([
                        'statusCode' => 404,
                        'message' => '请求不存在！'
                    ]);
            }
        }

        
        if ($e instanceof \Exception) {
            return response()->json([
                'message' => $e->getMessage(),
                'statusCode' => 500
            ]);
        }
        
        return parent::render($request, $e);
    }
}
