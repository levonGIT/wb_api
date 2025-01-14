<?php

namespace App\Http\Services;

use Illuminate\Support\Facades\Http;

class ApiCallerService
{
    /**
     * Call api by url with url params
     *
     * @return Response::json
     */
    protected function callApi(string $url, array $params)
    {
        $response = Http::get(config('services.api_access.url') . $url, $params + [
                'key' =>  config('services.api_access.key')
            ]);

        return $response->json();
    }
}