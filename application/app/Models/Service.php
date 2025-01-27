<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $table = 'Services';

    public $timestamps = false;

    public function tokenTypes()
    {
        return $this->hasMany(TokenType::class);
    }
}
