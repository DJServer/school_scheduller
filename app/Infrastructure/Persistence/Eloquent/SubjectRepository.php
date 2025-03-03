<?php

namespace App\Infrastructure\Persistence\Eloquent;

use App\Domain\Subject\Entities\SubjectEntity;
use App\Domain\Subject\Repositories\SubjectRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\Models\SubjectModel;

class SubjectRepository implements SubjectRepositoryInterface
{
    public function findById(int $id): ?SubjectEntity
    {
        $subject = SubjectModel::find($id);
        return $subject ? new SubjectEntity($subject->id, $subject->name) : null;
    }

    public function getAll(): array
    {
        return SubjectModel::all()->map(fn($subject) => new SubjectEntity($subject->id, $subject->name))->toArray();
    }
}
