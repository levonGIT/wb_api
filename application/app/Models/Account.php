<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    use HasFactory;

    protected $table = 'Accounts';

    public $timestamps = false;

    protected $guarded = [];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function token()
    {
        return $this->hasOne(Token::class);
    }

    public function incomes()
    {
        return $this->hasMany(Income::class);
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function stocks()
    {
        return $this->hasMany(Stock::class);
    }

    public function sales()
    {
        return $this->hasMany(Sale::class);
    }
}
