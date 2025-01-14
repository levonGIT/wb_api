<?php

namespace App\Console\Commands;

use App\Http\Services\StockService;
use Illuminate\Console\Command;

class ApiStockParse extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'api:stocks {dateFrom?} {limit?} {page?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Parse stocks from api';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle(): void
    {
        $args = $this->arguments();

        $params = [
            'dateFrom' => $args['dateFrom'],
            'limit' => $args['limit'] ?? 500,
            'page' => $args['page'] ?? 1,
        ];

        (new StockService)->getRecords($params);
    }
}
