<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ApiIncomeParse extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'api:incomes {limit} {page}';

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
        $lim = $this->argument('limit');
        $page = $this->argument('page');

        dd($lim,$page);
    }
}
