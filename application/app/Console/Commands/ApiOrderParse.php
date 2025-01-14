<?php

namespace App\Console\Commands;

use App\Http\Services\OrderService;
use Illuminate\Console\Command;

class ApiOrderParse extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'api:orders {dateFrom?} {dateTo?} {limit?} {page?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Parse orders from api';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle(): void
    {
        $args = $this->arguments();

        $params = [
            'dateFrom' => $args['dateFrom'] ?? '1999-01-01',
            'dateTo' => $args['dateTo'] ?? now()->format('Y-m-d'),
            'limit' => $args['limit'] ?? 500,
            'page' => $args['page'] ?? 1,
        ];

        (new OrderService)->getRecords($params);
    }
}
