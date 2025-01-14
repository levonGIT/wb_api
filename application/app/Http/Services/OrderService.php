<?php

namespace App\Http\Services;

use App\Filters\ServiceInterface;
use App\Models\Order;

class OrderService extends ApiCallerService implements ServiceInterface
{
    static string $url = 'orders';

    /**
     * Get order records from api with params
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
     * Save order records to DB
     *
     * @param array $records
     * @return void
     */
    private function saveRecords(array $records): void
    {
        Order::insert($records);
    }
}