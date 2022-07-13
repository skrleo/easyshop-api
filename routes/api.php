<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group([
    'middleware' => ['tenant.init']
], function () {
    Route::group([
        'namespace' => 'Home',
    ], function () {
        Route::get('/home/lists', 'HomeController@lists')->name('home.lists');
        Route::get('/page/init', 'HomeController@share')->name('page.share');
        Route::get('/help/lists', 'HomeController@help')->name('help.lists');
        Route::get('/rich/resolve', 'HomeController@resolve')->name('rich.resolve');
        Route::get('/home/activity', 'HomeController@activity')->name('home.activity');
        Route::get('/home/tenant', 'HomeController@tenant')->name('home.tenant');
        // 搜索历史
        Route::get('/search/lists', 'SearchController@lists')->name('search.lists');
        Route::post('/search/store', 'SearchController@store')->name('search.store');
        Route::get('/search/destroy', 'SearchController@destroy')->name('search.destroy');
    });

    // 授权登录
    Route::get('oauth/login', 'Login\LoginController@login')->name('oauth.login');
    Route::post('oauth/sync', 'Login\LoginController@sync')->name('oauth.sync');
    Route::post('oauth/register', 'Login\LoginController@oauth')->name('oauth.register');

    // 商品管理
    Route::group([
        'namespace' => 'Goods',
    ], function () {
        // 盲盒
        Route::get('blind_box/lists', 'BlindBoxController@lists')->name('blind_box.lists');
        Route::get('blind_box/detail', 'BlindBoxController@detail')->name('blind_box.detail');

        Route::get('goods/lists', 'GoodsController@lists')->name('goods.lists');
        Route::get('goods/category', 'GoodsController@category')->name('goods.category');
        Route::get('goods/detail', 'GoodsController@detail')->name('goods.detail');
        Route::get('goods/poster', 'GoodsController@poster')->name('goods.poster');
        Route::get('comment/lists', 'GoodsController@commentLists')->name('comment.lists');

        Route::group([
            'middleware' => ['jwt.auth']
        ], function () {
            Route::get('blind_box/prize', 'BlindBoxController@prize')->name('blind_box.prize');
            Route::get('blind_box/draw', 'BlindBoxController@draw')->name('blind_box.draw');
            Route::get('blind_box/open', 'BlindBoxController@open')->name('blind_box.open');
            Route::get('blind_box/order', 'BlindBoxController@order')->name('blind_box.order');
            Route::get('coupon/lists', 'GoodsController@coupon')->name('coupon.lists');
            Route::get('reap/coupon', 'GoodsController@reap')->name('coupon.reap');
            Route::post('goods/comment', 'GoodsController@comment')->name('goods.comment');
            
            // Route::get('groupon/open', 'GrouponController@open')->name('groupon.open');
        });
    });

    Route::any('wxpay/callback', 'Pay\PayController@callback')->name('wxpay.callack');
    
    Route::group([
        'middleware' => ['jwt.auth']
    ], function () {

        Route::get('user/member', 'User\UserController@member')->name('user.member');
        Route::get('user/personal', 'User\UserController@personal')->name('user.personal');
        // 订单支付
        Route::get('create/pay', 'Pay\PayController@create')->name('pay.create');
        Route::get('order/pay', 'Pay\PayController@pay')->name('pay.order');

        // 购物车
        Route::group([
            'namespace' => 'ShopCart',
        ], function () {
            Route::get('cart/lists', 'ShopCartController@lists')->name('cart.lists');
            Route::post('cart/store', 'ShopCartController@store')->name('cart.store');
            Route::post('cart/update', 'ShopCartController@update')->name('cart.update');
            Route::get('cart/info', 'ShopCartController@info')->name('cart.info');
            Route::get('cart/delete', 'ShopCartController@delete')->name('cart.delete');
        });

        // 订单管理
        Route::group([
            'namespace' => 'Order',
        ], function () {
            Route::get('order/confirm', 'OrderController@confirm')->name('order.confirm');
            Route::get('order/lists', 'OrderController@lists')->name('order.lists');
            Route::get('order/detail', 'OrderController@detail')->name('order.detail');
            Route::get('order/close', 'OrderController@close')->name('order.close');
            Route::post('order/refund', 'OrderController@refund')->name('order.refund');
        });
        
        // 地址管理
        Route::group([
            'namespace' => 'Address',
        ], function () {
            Route::get('address/lists', 'AddressController@lists')->name('address.lists');
            Route::get('address/detail', 'AddressController@detail')->name('address.detail');
            Route::post('address/store', 'AddressController@store')->name('address.store');
            Route::post('address/update', 'AddressController@update')->name('address.update');
            Route::get('address/delete', 'AddressController@delete')->name('address.delete');
        });

    });

});
