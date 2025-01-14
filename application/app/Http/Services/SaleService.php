<?php

namespace App\Http\Services;

use App\Models\Sale;

class SaleService extends ApiCallerService
{
    static string $url = 'sales';

    /**
     * Get sale records from api with params
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
     * Save sale records to DB
     *
     * @return void
     */
    private function saveRecords(array $records)
    {
        Sale::insert($records);
    }
}