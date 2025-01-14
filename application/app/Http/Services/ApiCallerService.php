<?php

namespace App\Http\Services;

use Illuminate\Support\Facades\Http;

class ApiCallerService
{
    protected function callApi($url, $params)
    {
        $response = Http::get(config('services.api_access.url') . $url, $params + [
                'key' =>  config('services.api_access.key')
            ]);

        return $response->json();
    }
}