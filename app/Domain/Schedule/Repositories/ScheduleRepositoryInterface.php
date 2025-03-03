<?php

namespace App\Domain\Schedule\Repositories;

use App\Domain\Schedule\Entities\ScheduleEntity;

interface ScheduleRepositoryInterface
{
    public function getByDayAndBell(int $dayId, int $bellId): array;
    public function save(ScheduleEntity $schedule): void;
}
