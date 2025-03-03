<?php

namespace App\Interface\Livewire;

use Livewire\Component;
use App\Application\Services\ScheduleGeneratorService;
use App\Infrastructure\Persistence\Eloquent\ScheduleRepository;

class ScheduleGenerator extends Component
{
    private ScheduleGeneratorService $scheduleGeneratorService;
    private ScheduleRepository $scheduleRepository;

    public function __construct()
    {
        $this->scheduleGeneratorService = app(ScheduleGeneratorService::class);
        $this->scheduleRepository = app(ScheduleRepository::class);
    }

    public function generate()
    {
        $this->scheduleGeneratorService->generate();
    }

    public function render()
    {
        return view('livewire.schedule-generator', [
            'schedule' => $this->scheduleRepository->getAll()
        ]);
    }
}
