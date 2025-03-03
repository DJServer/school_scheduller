<?php

namespace App\Infrastructure\Persistence\Eloquent\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ScheduleModel extends Model
{
    use HasFactory;

    protected $table = 'schedule';
    protected $fillable = ['day_id', 'bell_id', 'class_id', 'subject_id', 'teacher_id'];

    public function day()
    {
        return $this->belongsTo(DayModel::class, 'day_id');
    }

    public function bell()
    {
        return $this->belongsTo(BellModel::class, 'bell_id');
    }

    public function class()
    {
        return $this->belongsTo(ClassModel::class, 'class_id');
    }

    public function subject()
    {
        return $this->belongsTo(SubjectModel::class, 'subject_id');
    }

    public function teacher()
    {
        return $this->belongsTo(TeacherModel::class, 'teacher_id');
    }

    public function clear(): void
    {
        ScheduleModel::truncate();
    }

}
