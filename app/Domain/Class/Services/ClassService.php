<?php

namespace App\Domain\Class\Services;

use App\Domain\Class\Repositories\ClassRepositoryInterface;

class ClassService
{
    private ClassRepositoryInterface $classRepository;

    public function __construct(ClassRepositoryInterface $classRepository)
    {
        $this->classRepository = $classRepository;
    }

    public function getAllClasses(): array
    {
        return $this->classRepository->getAll();
    }
}
