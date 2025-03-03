<?php

namespace App\Domain\Teacher\Repositories;

use App\Domain\Teacher\Entities\TeacherEntity;

interface TeacherRepositoryInterface
{
    public function findById(int $id): ?TeacherEntity;
    public function getAll(): array;
}
