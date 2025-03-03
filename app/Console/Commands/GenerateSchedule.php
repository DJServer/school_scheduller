<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Application\Services\ScheduleGeneratorService;

class GenerateSchedule extends Command
{
    protected $signature = 'schedule:generate';
    protected $description = 'Генерирует школьное расписание';

    private ScheduleGeneratorService $scheduleGeneratorService;

    public function __construct(ScheduleGeneratorService $scheduleGeneratorService)
    {
        parent::__construct();
        $this->scheduleGeneratorService = $scheduleGeneratorService;
    }

    public function handle()
    {
        $this->info('Генерация расписания');
        $this->scheduleGeneratorService->generate();
        $this->info('Расписание сгенерировано!');
    }
}
