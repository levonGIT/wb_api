<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TokenType extends Model
{
    use HasFactory;

    protected $table = 'Token_types';

    public $timestamps = false;

    public function tokens()
    {
        return $this->hasMany(Token::class);
    }

    public function services()
    {
        return $this->hasMany(Service::class);
    }
}
