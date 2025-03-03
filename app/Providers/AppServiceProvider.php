<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Domain\Class\Repositories\ClassRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\ClassRepository;
use App\Domain\Teacher\Repositories\TeacherRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\TeacherRepository;
use App\Domain\Subject\Repositories\SubjectRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\SubjectRepository;
use App\Domain\Day\Repositories\DayRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\DayRepository;
use App\Domain\Bell\Repositories\BellRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\BellRepository;
use App\Domain\Schedule\Repositories\ScheduleRepositoryInterface;
use App\Infrastructure\Persistence\Eloquent\ScheduleRepository;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(ClassRepositoryInterface::class, ClassRepository::class);
        $this->app->bind(TeacherRepositoryInterface::class, TeacherRepository::class);
        $this->app->bind(SubjectRepositoryInterface::class, SubjectRepository::class);
        $this->app->bind(DayRepositoryInterface::class, DayRepository::class);
        $this->app->bind(BellRepositoryInterface::class, BellRepository::class);
        $this->app->bind(ScheduleRepositoryInterface::class, ScheduleRepository::class);
    }

    public function boot(): void
    {
        //
    }
}
