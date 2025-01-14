<?php

namespace App\Http\Services;

use App\Models\Income;

class IncomeService extends ApiCallerService
{
    static string $url = 'incomes';

    public function getRecords($params)
    {
        $resp = $this->callApi(self::$url, $params);
        $records = $resp['data'];
        $this->saveRecords($records);

        if($resp['links']['next']){
            $params['page']++;
            $this->getRecords($params);
        }
    }

    private function saveRecords($records)
    {
        Income::insert($records);
    }
}