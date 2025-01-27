<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Income extends Model
{
    use HasFactory;

    protected $table = 'Incomes';

    public $timestamps = false;

    protected $guarded = [];

    public function account()
    {
        return $this->hasOne(Account::class);
    }
}
