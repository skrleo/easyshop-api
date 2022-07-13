<?php
namespace App\Console\Commands;

use App\Models\Order;
use Exception;
use Illuminate\Console\Command;
use Log;

class OrderSyncClose extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'order:close';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '15天后订单状态改为已完成';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->comment("$this->description");

        $order = $this->getOrder();
        // 创建进度条
        $bar = $this->output->createProgressBar(count($order));
        foreach($order as $item){
            Order::query()->where('order_id', $item['order_id'])->update([
                'status' => Order::TRADING_SUCCESS_ORDER,
                'end_time' => date('Y-m-d H:i:s')
            ]);
            // 奖励成长值

            $bar->advance();
        }
        $this->comment(PHP_EOL);
    }

    /**
     * 获取到期的订单
     * 
     * @author ChenGuangHui
     * @dateTime 2022-06-18
     */
    protected function getOrder()
    {
        $order =  Order::query()->where('status', Order::HAVE_SHIPPED_ORDER)->where('created_at', '<', date('Y-m-d H:i:s', time() - (15 * 24 * 3600)))->get()->toArray();
        return $order;
    }
}
