<?php

namespace App\Http\Services;

use App\Filters\ServiceInterface;
use App\Models\Income;

class IncomeService extends ApiCallerService implements ServiceInterface
{
    static string $url = 'incomes';

    /**
     * Get income records from api with params
     *
     * @param array $params
     * @return void
     */
    public function getRecords(array $params): void
    {
        $resp = $this->callApi(self::$url, $params);
        $records = $resp['data'] ?? [];
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
     * @param array $records
     * @return void
     */
    private function saveRecords(array $records): void
    {
        Income::insert($records);
    }
}