<?php

namespace App\Domain\Bell\Entities;

class BellEntity
{
    private int $id;
    private string $name;
    private string $startTime;
    private string $endTime;
    private bool $isBreak;

    public function __construct(int $id, string $name, string $startTime, string $endTime, bool $isBreak)
    {
        $this->id = $id;
        $this->name = $name;
        $this->startTime = $startTime;
        $this->endTime = $endTime;
        $this->isBreak = $isBreak;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getStartTime(): string
    {
        return $this->startTime;
    }

    public function getEndTime(): string
    {
        return $this->endTime;
    }

    public function isBreak(): bool
    {
        return $this->isBreak;
    }
}
