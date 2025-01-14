<?php

namespace App\Console\Commands;

use App\Http\Services\IncomeService;
use Carbon\Carbon;
use Illuminate\Console\Command;

class ApiIncomeParse extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'api:incomes {dateFrom?} {dateTo?} {limit?} {page?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Parse incomes from api';

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

        (new IncomeService)->getRecords($params);
    }
}
