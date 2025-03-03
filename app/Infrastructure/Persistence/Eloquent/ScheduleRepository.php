<?php

namespace App\Infrastructure\Persistence\Eloquent;

use App\Domain\Schedule\Entities\ScheduleEntity;
use App\Domain\Schedule\Repositories\ScheduleRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\Models\ScheduleModel;
use App\Domain\Day\Entities\DayEntity;
use App\Domain\Bell\Entities\BellEntity;
use App\Domain\Class\Entities\ClassEntity;
use App\Domain\Subject\Entities\SubjectEntity;
use App\Domain\Teacher\Entities\TeacherEntity;

class ScheduleRepository implements ScheduleRepositoryInterface
{
    public function getByDayAndBell(int $dayId, int $bellId): array
    {
        return ScheduleModel::where('day_id', $dayId)
            ->where('bell_id', $bellId)
            ->get()
            ->map(function ($schedule) {
                return new ScheduleEntity(
                    $schedule->id,
                    new DayEntity($schedule->day->id, $schedule->day->name),
                    new BellEntity($schedule->bell->id, $schedule->bell->name, $schedule->bell->start_time, $schedule->bell->end_time, $schedule->bell->is_break),
                    new ClassEntity($schedule->class->id, $schedule->class->name),
                    new SubjectEntity($schedule->subject->id, $schedule->subject->name),
                    new TeacherEntity($schedule->teacher->id, $schedule->teacher->name)
                );
            })->toArray();
    }

    public function save(ScheduleEntity $schedule): void
    {
        ScheduleModel::create([
            'day_id' => $schedule->getDay()->getId(),
            'bell_id' => $schedule->getBell()->getId(),
            'class_id' => $schedule->getClass()->getId(),
            'subject_id' => $schedule->getSubject()->getId(),
            'teacher_id' => $schedule->getTeacher()->getId(),
        ]);
    }

    public function getAll(): array
    {
        return ScheduleModel::with(['day', 'bell', 'class', 'subject', 'teacher'])->get()
            ->map(fn($schedule) => new ScheduleEntity(
                $schedule->id,
                new DayEntity($schedule->day->id, $schedule->day->name),
                new BellEntity($schedule->bell->id, $schedule->bell->name, $schedule->bell->start_time, $schedule->bell->end_time, $schedule->bell->is_break),
                new ClassEntity($schedule->class->id, $schedule->class->name),
                new SubjectEntity($schedule->subject->id, $schedule->subject->name),
                new TeacherEntity($schedule->teacher->id, $schedule->teacher->name)
            ))->toArray();
    }

    public function teacherHasLessonAtTime(int $dayId, int $bellId, int $teacherId): bool
    {
        return ScheduleModel::where('day_id', $dayId)
            ->where('bell_id', $bellId)
            ->where('teacher_id', $teacherId)
            ->exists();
    }


    public function clear(): void
    {
        ScheduleModel::truncate();
    }
}
