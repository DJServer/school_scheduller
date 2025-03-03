<?php

namespace App\Domain\Teacher\Entities;

use App\Domain\Subject\Entities\SubjectEntity;

class TeacherEntity
{
    private int $id;
    private string $name;
    private array $subjects = [];

    public function __construct(int $id, string $name, array $subjects = [])
    {
        $this->id = $id;
        $this->name = $name;
        $this->subjects = $subjects;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getSubjects(): array
    {
        return $this->subjects;
    }

    public function canTeach(SubjectEntity $subject): bool
    {
        return in_array($subject->getId(), array_map(fn($s) => $s->getId(), $this->subjects));
    }

}
