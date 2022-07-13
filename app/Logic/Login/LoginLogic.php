<?php


namespace App\Logic\Login;


use App\Logic\Logic;
use App\Models\User;
use App\Services\InviteCode\InviteCodeService;
use EasyWeChat\Factory;

class LoginLogic extends Logic
{
    const USER_IDENT = 'user_ident'; #身份标识

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     * @throws \EasyWeChat\Kernel\Exceptions\InvalidConfigException
     */
    public static function login($params)
    {
        $config = [
            'app_id' => 'wx18de60cc2f0b2af4',
            'secret' => 'e1b2fcf261338d753b23080f22c471b1',
        ];
        $app = Factory::miniProgram($config);
        $info = $app->auth->session($params['code']);
        $user = User::query()->where('openid', $info['openid'])->where('status', 0)->first();
        if (!empty($user)) {
            if (!$jwt_token = auth('api')->login($user)) {
                return error('登录失败!', 300);
            }
            return data([
                'is_login' => true,
                'token' => $jwt_token,
                'user' => auth('api')->user()
            ]);
        }
        $data = array(
            'is_login' => false,
            'openid' => $info['openid'],
            'session_key' => $info['session_key']
        );
        return data($data);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     */
    public function sync($params)
    {
        $user = User::query()->where('uid', auth('api')->id())->first();
        if (empty($user)) {
            return error('更新失败！');
        }
        $data = array(
            'nickname' => $params['nickname'] ?? '',
            'avatar_url' => $params['avatar_url'] ?? '',
        );
        $user = User::query()->where('uid', auth('api')->id())->update($data);
        if (!$user) {
            return error("更新用户信息失败！");
        }
        $user = User::query()->where('uid', auth('api')->id())->first();
        return data([
            'is_login' => true,
            'token' => auth('api')->login($user),
            'user' => $user
        ]);
    }

    /**
     * @param $params
     * @return \Illuminate\Http\JsonResponse
     * @throws \EasyWeChat\Kernel\Exceptions\DecryptException
     * @throws \Throwable
     */
    public function oauth($params)
    {
        $user = User::query()->where('openid', $params['openid'])->first();
        abort_if($user, 500, '您已注册用户，请直接登录！');

        $config = [
            'app_id' => 'wx18de60cc2f0b2af4',
            'secret' => 'e1b2fcf261338d753b23080f22c471b1',
        ];
        $app = Factory::miniProgram($config);
        // 判断是否解析出手机号码
        $decryptInfo = $app->encryptor->decryptData($params['session'], $params['iv'], $params['encrypted']);
        $inviteCode = InviteCodeService::instance(6, self::USER_IDENT);
        $data = array(
            'nickname' => $params['nickname'] ?? 0,
            'sex' => $params['sex'],
            'register_ip' => request()->getClientIp(),
            'mobile' => $decryptInfo['phoneNumber'] ?? '',
            'avatar_url' => $params['avatar_url'] ?? '',
            'password' => bcrypt($this->randomStr(6)),
            'openid' => $params['openid'],
            'invite_code' => $inviteCode->encode(User::query()->count())
        );
        $user = User::query()->create($data);
        return data([
            'token' => auth('api')->login($user),
            'user' => $user,
            'is_login' => true,
        ]);
    }
}
