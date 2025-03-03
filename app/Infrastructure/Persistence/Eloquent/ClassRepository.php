<?php

namespace App\Infrastructure\Persistence\Eloquent;

use App\Domain\Class\Entities\ClassEntity;
use App\Domain\Class\Repositories\ClassRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\Models\ClassModel;

class ClassRepository implements ClassRepositoryInterface
{
    public function findById(int $id): ?ClassEntity
    {
        $class = ClassModel::find($id);
        return $class ? new ClassEntity($class->id, $class->name) : null;
    }

    public function getAll(): array
    {
        return ClassModel::all()->map(fn($class) => new ClassEntity($class->id, $class->name))->toArray();
    }
}
