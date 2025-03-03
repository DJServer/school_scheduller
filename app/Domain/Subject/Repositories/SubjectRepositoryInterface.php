<?php

namespace App\Domain\Subject\Repositories;

use App\Domain\Subject\Entities\SubjectEntity;

interface SubjectRepositoryInterface
{
    public function findById(int $id): ?SubjectEntity;
    public function getAll(): array;
}
