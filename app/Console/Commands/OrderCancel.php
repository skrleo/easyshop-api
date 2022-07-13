<?php
/*
 * @author: ChenGuangHui
 */

namespace App\Console\Commands;

use App\Models\Order;
use Exception;
use Illuminate\Console\Command;
use Log;

class OrderCancel extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'order:cancel';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '每分钟查询是否有待取消的订单';

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
            foreach($item['order_goods'] as $order){
                // 库存回填

                Order::query()->where('order_id', $order['order_id'])->update([
                    'status' => Order::TRADING_CLOSED_ORDER,
                    'close_time' => date('Y-m-d H:i:s')
                ]);
            }
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
        // 到时间未付款订单
        $order =  Order::query()
            ->with('orderGoods')
            ->where('status', Order::WAIT_PAID_ORDER)
            ->where('created_at', '<', date('Y-m-d H:i:s', time() - (15 * 60)))
            ->get()->toArray();
        
        // 申请退款的订单

        return $order;
    }
}
