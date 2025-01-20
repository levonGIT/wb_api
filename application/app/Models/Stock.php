<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    use HasFactory;

    protected $table = 'Stocks';

    public $timestamps = false;

    protected $guarded = [];

    public function account()
    {
        return $this->hasOne(Account::class);
    }
}
