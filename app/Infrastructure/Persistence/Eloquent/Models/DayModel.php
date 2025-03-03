<?php

namespace App\Infrastructure\Persistence\Eloquent\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DayModel extends Model
{
    use HasFactory;

    protected $table = 'days';
    protected $fillable = ['name'];
}
