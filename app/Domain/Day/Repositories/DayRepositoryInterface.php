<?php

namespace App\Domain\Day\Repositories;

use App\Domain\Day\Entities\DayEntity;

interface DayRepositoryInterface
{
    public function findById(int $id): ?DayEntity;
    public function getAll(): array;
}
