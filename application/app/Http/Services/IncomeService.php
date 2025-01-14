<?php

namespace App\Http\Services;

class IncomeService extends ApiCallerService
{
    static string $url = 'incomes';

    public function getRecords()
    {
        dd($this->callApi(self::$url));
    }
}