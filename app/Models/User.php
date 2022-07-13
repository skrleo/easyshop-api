<?php


namespace App\Models;


use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Overtrue\EasySms\PhoneNumber;

class User extends Authenticatable implements JWTSubject
{
    use Notifiable;

    protected $table = 'store_user';	//用户表
    
    protected $primaryKey = 'uid';

    protected $appends = ['vip_level', 'next_level'];

    // Rest omitted for brevity

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    protected $casts = [
        'created_at' => 'datetime:Y-m-d H:i:s',
        'updated_at' => 'datetime:Y-m-d H:i:s',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token'
    ];

    public function routeNotificationForEasySms($notification)
    {
        return new PhoneNumber($this->number, $this->area_code);
    }

    /**
     * 获取会员等级
     * 
     * @author ChenGuangHui
     * @dateTime 2022-05-26
     */
    public function getVipLevelAttribute()
    {
        if (isset($this->attributes['growth'])) {
            $member = (new MemberLevel())->where('status', 1)->where('reach_growth', '<=', $this->attributes['growth'])->get()->max()->toArray();
            return $member ? $member['name'] : '普通会员';
        }
        return '普通会员';
    }

    /**
     * 获取下一等级
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-06
     */
    public function getNextLevelAttribute()
    {
        if (isset($this->attributes['growth'])) {
            $member = (new MemberLevel())->where('status', 1)->where('reach_growth', '>', $this->attributes['growth'])->first();
            return $member ? $member->name : '普通会员';
        }
        return '普通会员';
    }
    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    /**
     * 手机号码格式化
     *
     * @return string
     */
    public function getFormatMobileAttribute()
    {
        return $this->attributes['format_mobile'] = format_mobile($this->attributes['mobile']);
    }
}
