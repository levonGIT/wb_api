<?php

namespace App\Http\Services;

use App\Models\Income;

class IncomeService extends ApiCallerService
{
    static string $url = 'incomes';

    /**
     * Get income records from api with params
     *
     * @return void
     */
    public function getRecords(array $params)
    {
        $resp = $this->callApi(self::$url, $params);
        $records = $resp['data'];
        if($records){
            $this->saveRecords($records);
            if($resp['links']['next']){
                $params['page']++;
                $this->getRecords($params);
            }
        }
    }

    /**
     * Save income records to DB
     *
     * @return void
     */
    private function saveRecords(array $records)
    {
        Income::insert($records);
    }
}