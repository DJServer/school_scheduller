<?php

namespace App\Domain\Bell\Repositories;

use App\Domain\Bell\Entities\BellEntity;

interface BellRepositoryInterface
{
    public function findById(int $id): ?BellEntity;
    public function getAll(): array;
}
