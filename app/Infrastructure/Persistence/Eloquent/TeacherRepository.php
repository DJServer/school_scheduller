<?php

namespace App\Infrastructure\Persistence\Eloquent;

use App\Domain\Teacher\Entities\TeacherEntity;
use App\Domain\Teacher\Repositories\TeacherRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\Models\TeacherModel;
use App\Domain\Subject\Entities\SubjectEntity;

class TeacherRepository implements TeacherRepositoryInterface
{
    public function findById(int $id): ?TeacherEntity
    {
        $teacher = TeacherModel::with('subjects')->find($id);
        return $teacher ? new TeacherEntity(
            $teacher->id,
            $teacher->name,
            $teacher->subjects->map(fn($subject) => new SubjectEntity($subject->id, $subject->name))->toArray()
        ) : null;
    }

    public function getAll(): array
    {
        return TeacherModel::with('subjects')->get()->map(fn($teacher) => new TeacherEntity(
            $teacher->id,
            $teacher->name,
            $teacher->subjects->map(fn($subject) => new SubjectEntity($subject->id, $subject->name))->toArray()
        ))->toArray();
    }
}
