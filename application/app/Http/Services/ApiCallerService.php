<?php

namespace App\Http\Services;

use Illuminate\Support\Facades\Http;

class ApiCallerService
{
    protected function callApi($url)
    {
        $response = Http::get(config('api_access.url') . $url, [
            'key' =>  config('api_access.key')
        ]);

        return $response->json();
    }
}