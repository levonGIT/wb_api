<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;

    protected $table = 'Sales';

    public $timestamps = false;

    protected $guarded = [];

    public function account()
    {
        return $this->hasOne(Account::class);
    }
}
