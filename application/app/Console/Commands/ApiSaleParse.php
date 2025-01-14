<?php

namespace App\Console\Commands;

use App\Http\Services\SaleService;
use Illuminate\Console\Command;

class ApiSaleParse extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'api:sales {dateFrom?} {dateTo?} {limit?} {page?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Parse sales from api';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $args = $this->arguments();

        $params = [
            'dateFrom' => $args['dateFrom'] ?? '1999-01-01',
            'dateTo' => $args['dateTo'] ?? now()->format('Y-m-d'),
            'limit' => $args['limit'] ?? 500,
            'page' => $args['page'] ?? 1,
        ];

        (new SaleService)->getRecords($params);
    }
}
