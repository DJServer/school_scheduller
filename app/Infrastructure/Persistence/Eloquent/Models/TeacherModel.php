<?php

namespace App\Infrastructure\Persistence\Eloquent\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class TeacherModel extends Model
{
    use HasFactory;

    protected $table = 'teachers';
    protected $fillable = ['name'];

    public function subjects(): belongsToMany
    {
        return $this->belongsToMany(SubjectModel::class, 'teacher_subject', 'teacher_id', 'subject_id');
    }

}
