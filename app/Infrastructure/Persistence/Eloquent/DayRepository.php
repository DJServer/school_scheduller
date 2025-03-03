<?php

namespace App\Infrastructure\Persistence\Eloquent;

use App\Domain\Day\Entities\DayEntity;
use App\Domain\Day\Repositories\DayRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\Models\DayModel;

class DayRepository implements DayRepositoryInterface
{
    public function findById(int $id): ?DayEntity
    {
        $day = DayModel::find($id);
        return $day ? new DayEntity($day->id, $day->name) : null;
    }

    public function getAll(): array
    {
        return DayModel::all()->map(fn($day) => new DayEntity($day->id, $day->name))->toArray();
    }
}
