<?php

/**
 * Author: ChenGuangHui
 * Email：13035809409@163.com
 * Date Time: 2022/1/10 10:17
 */

namespace App\Notifications;

use App\Http\Common\lib\DingDing;
use App\Mail\AlarmMail;
use App\Mail\RegisterMail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Leonis\Notifications\EasySms\Channels\EasySmsChannel;
use Leonis\Notifications\EasySms\Messages\EasySmsMessage;

class OrderNotify extends Notification
{
    use Queueable;

    public $model;

    /**
     * Create a new notification instance.
     * @param Model $model
     */
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via(Model $notifiable)
    {
        $via = ['database'];

        if ($notifiable->notice_type&1) {
            $this->toDingding();
        }

        if ($notifiable->notice_type&2) {
            $via[] = 'mail';
        }

        if ($notifiable->notice_type&4) {
            $via[] = EasySmsChannel::class;
        }

        return $via;
    }

    /**
     * @param $notifiable
     * @return EasySmsMessage
     */
    public function toEasySms($notifiable)
    {
        return (new EasySmsMessage())
            ->setContent('预警消息测试')
            ->setTemplate(env('ALISMS_TEMPLATE_LOGIN_CODE'))
            ->setData(['code' => '测试']);
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return RegisterMail
     */
    public function toMail($notifiable)
    {
        return (new AlarmMail($this->model))->to(env('ALARM_EMAIL'));
    }

    /**
     * Get the array representation of the notification.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'title' => $notifiable->title,
            'agent_id' => $notifiable->agent_id,
            'srv_ids' => $notifiable->srv_ids,
            'notice_type' => $notifiable->notice_type,
            'content' => $notifiable->content
        ];
    }

    /**
     * @author ChenGuangHui
     * @dateTime 2022-01-11
     * @param mixed $notifiable
     *
     * @return void
     */
    protected function toDingding()
    {
        $data = [
            'msgtype' => 'markdown',
            'markdown' => [
                "title" => $this->model->title,
                "text" => $this->model->content
            ],
            'at' => [
                'isAtAll' => true
            ]
        ];
        $web_hook = config('alisms.dingding.url') . config('alisms.dingding.access_token');
        $secret = config('alisms.dingding.secret');
        //如果操作失败 则钉钉消息提醒
        DingDing::getInstance($web_hook, $secret)->send_message($data);
    }
    
}
