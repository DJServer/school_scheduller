<?php

namespace App\Interface\Livewire;

use Livewire\Component;
use App\Domain\Schedule\Repositories\ScheduleRepositoryInterface;
use App\Application\Services\ScheduleGeneratorService;
use App\Domain\Day\Repositories\DayRepositoryInterface;
use App\Domain\Class\Repositories\ClassRepositoryInterface;
use App\Domain\Teacher\Repositories\TeacherRepositoryInterface;

class ScheduleTable extends Component
{
    public string $selectedDay = '';
    public string $selectedClass = '';
    public string $selectedTeacher = '';

    protected $scheduleRepository;
    protected $scheduleGeneratorService;
    protected $dayRepository;
    protected $classRepository;
    protected $teacherRepository;

    public function mount()
    {
        $this->initializeDependencies();
    }

    public function hydrate()
    {
        $this->initializeDependencies();
    }

    private function initializeDependencies()
    {
        $this->scheduleRepository = app(ScheduleRepositoryInterface::class);
        $this->scheduleGeneratorService = app(ScheduleGeneratorService::class);
        $this->dayRepository = app(DayRepositoryInterface::class);
        $this->classRepository = app(ClassRepositoryInterface::class);
        $this->teacherRepository = app(TeacherRepositoryInterface::class);
    }

    public function generateSchedule()
    {
        \Log::info('Генерация расписания началась!');
        $this->scheduleGeneratorService->generate();
        \Log::info('Генерация завершена, отправляем событие.');
        $this->dispatch('schedule-generated');
    }

    public function render()
    {
        // Приводим к коллекции для фильтрации
        $schedule = collect($this->scheduleRepository->getAll());

        if (!empty($this->selectedDay)) {
            $schedule = $schedule->filter(fn($s) => $s->getDay()->getId() == $this->selectedDay);
        }

        if (!empty($this->selectedClass)) {
            $schedule = $schedule->filter(fn($s) => $s->getClass()->getId() == $this->selectedClass);
        }

        if (!empty($this->selectedTeacher)) {
            $schedule = $schedule->filter(fn($s) => $s->getTeacher()->getId() == $this->selectedTeacher);
        }

        return view('livewire.interface.livewire.schedule-table', [
            'schedule' => $schedule->values()->all(),
            'days' => $this->dayRepository->getAll(),
            'classes' => $this->classRepository->getAll(),
            'teachers' => $this->teacherRepository->getAll(),
        ]);
    }

}
