<?php

namespace App\Domain\Class\Repositories;

use App\Domain\Class\Entities\ClassEntity;

interface ClassRepositoryInterface
{
    public function findById(int $id): ?ClassEntity;

    public function getAll(): array;
}
