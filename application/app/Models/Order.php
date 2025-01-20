<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = 'Orders';

    public $timestamps = false;

    protected $guarded = [];

    public function account()
    {
        return $this->hasOne(Account::class);
    }
}
