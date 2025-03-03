<?php

namespace App\Infrastructure\Persistence\Eloquent;

use App\Domain\Bell\Entities\BellEntity;
use App\Domain\Bell\Repositories\BellRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\Models\BellModel;

class BellRepository implements BellRepositoryInterface
{
    public function findById(int $id): ?BellEntity
    {
        $bell = BellModel::find($id);
        return $bell ? new BellEntity($bell->id, $bell->name, $bell->start_time, $bell->end_time, $bell->is_break) : null;
    }

    public function getAll(): array
    {
        return BellModel::all()->map(fn($bell) => new BellEntity(
            $bell->id,
            $bell->name,
            $bell->start_time,
            $bell->end_time,
            $bell->is_break
        ))->toArray();
    }
}
