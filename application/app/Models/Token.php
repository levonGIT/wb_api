<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Token extends Model
{
    use HasFactory;

    protected $table = 'Tokens';

    public $timestamps = false;

    public function account()
    {
        return $this->hasOne(Account::class, 'id', 'account_id');
    }

    public function service()
    {
        return $this->belongsTo(Service::class, 'id', 'service_id');
    }

    public function tokenType()
    {
        return $this->hasOne(TokenType::class, 'id', 'token_type_id');
    }
}
