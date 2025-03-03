<?php

namespace App\Infrastructure\Persistence\Eloquent\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BellModel extends Model
{
    use HasFactory;

    protected $table = 'bells';
    protected $fillable = ['name', 'start_time', 'end_time', 'is_break'];
}
