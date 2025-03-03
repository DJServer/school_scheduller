<?php

namespace App\Application\Services;

use App\Domain\Schedule\Repositories\ScheduleRepositoryInterface;
use App\Domain\Day\Repositories\DayRepositoryInterface;
use App\Domain\Class\Repositories\ClassRepositoryInterface;
use App\Domain\Teacher\Repositories\TeacherRepositoryInterface;
use App\Domain\Subject\Repositories\SubjectRepositoryInterface;
use App\Domain\Bell\Repositories\BellRepositoryInterface;
use App\Domain\Schedule\Entities\ScheduleEntity;
use Illuminate\Support\Facades\Log;

class ScheduleGeneratorService
{
    private ScheduleRepositoryInterface $scheduleRepository;
    private DayRepositoryInterface $dayRepository;
    private ClassRepositoryInterface $classRepository;
    private TeacherRepositoryInterface $teacherRepository;
    private SubjectRepositoryInterface $subjectRepository;
    private BellRepositoryInterface $bellRepository;

    private int $minLessonsPerDay = 2;
    private int $maxLessonsPerDay = 6;

    // [day][bell] => teacherId
    private array $teacherSchedule = [];
    // [day][bell] => classId
    private array $classSchedule = [];
    // [day][class] => [subjects]
    private array $usedSubjects = [];

    public function __construct(
        ScheduleRepositoryInterface $scheduleRepository,
        DayRepositoryInterface $dayRepository,
        ClassRepositoryInterface $classRepository,
        TeacherRepositoryInterface $teacherRepository,
        SubjectRepositoryInterface $subjectRepository,
        BellRepositoryInterface $bellRepository
    ) {
        $this->scheduleRepository = $scheduleRepository;
        $this->dayRepository = $dayRepository;
        $this->classRepository = $classRepository;
        $this->teacherRepository = $teacherRepository;
        $this->subjectRepository = $subjectRepository;
        $this->bellRepository = $bellRepository;
    }

    public function generate(): void
    {
        // Очистка расписания перед генерацией
        $this->scheduleRepository->clear();

        $days = $this->dayRepository->getAll();
        $classes = $this->classRepository->getAll();
        $subjects = $this->subjectRepository->getAll();
        $teachers = $this->teacherRepository->getAll();

        // Убираем перемены из списка звонков
        $bells = collect($this->bellRepository->getAll())
            ->filter(fn($bell) => !$bell->isBreak())
            ->sortBy('start_time')
            ->values()
            ->toArray();

        foreach ($days as $day) {
            $this->teacherSchedule[$day->getId()] = [];
            $this->classSchedule[$day->getId()] = [];
            $this->usedSubjects[$day->getId()] = [];

            foreach ($classes as $class) {
                $lessonCount = rand($this->minLessonsPerDay, $this->maxLessonsPerDay);
                $availableBells = $bells;

                for ($i = 0; $i < $lessonCount; $i++) {
                    if (!isset($availableBells[$i])) break;

                    $bell = $availableBells[$i];

                    // уроки
                    $subject = $this->getAvailableSubject($day->getId(), $class->getId(), $subjects);
                    if (!$subject) continue;

                    // учителя
                    $teacher = $this->getAvailableTeacher($day->getId(), $bell->getId(), $subject, $teachers);
                    if (!$teacher) {
                        Log::warning("Нет свободного учителя для {$subject->getName()} в {$class->getName()}");
                        continue;
                    }

                    // проверка, не занят ли класс
                    if ($this->isClassBusy($day->getId(), $bell->getId(), $class->getId())) {
                        Log::warning("Класс {$class->getName()} уже занят в звонке {$bell->getId()}");
                        continue;
                    }

                    // добавляем запись
                    $schedule = new ScheduleEntity(null, $day, $bell, $class, $subject, $teacher);
                    $this->scheduleRepository->save($schedule);

                    $this->teacherSchedule[$day->getId()][$bell->getId()] = $teacher->getId();
                    $this->classSchedule[$day->getId()][$bell->getId()] = $class->getId();
                    $this->usedSubjects[$day->getId()][$class->getId()][] = $subject->getId();
                }
            }
        }
    }

    private function getAvailableSubject(int $dayId, int $classId, array $subjects)
    {
        $availableSubjects = array_filter($subjects, fn($s) => !in_array($s->getId(), $this->usedSubjects[$dayId][$classId] ?? []));
        return empty($availableSubjects) ? null : $availableSubjects[array_rand($availableSubjects)];
    }

    private function getAvailableTeacher(int $dayId, int $bellId, $subject, array $teachers)
    {
        $availableTeachers = array_filter($teachers, function ($teacher) use ($dayId, $bellId, $subject) {
            return $teacher->canTeach($subject) &&
                !$this->isTeacherBusy($dayId, $bellId, $teacher->getId()) &&
                !$this->isTeacherAlreadyScheduled($dayId, $bellId, $teacher->getId());
        });

        return empty($availableTeachers) ? null : $availableTeachers[array_rand($availableTeachers)];
    }

    private function isTeacherBusy(int $dayId, int $bellId, int $teacherId): bool
    {
        return isset($this->teacherSchedule[$dayId][$bellId]) && $this->teacherSchedule[$dayId][$bellId] === $teacherId;
    }

    private function isTeacherAlreadyScheduled(int $dayId, int $bellId, int $teacherId): bool
    {
        return $this->scheduleRepository->teacherHasLessonAtTime($dayId, $bellId, $teacherId);
    }

    private function isClassBusy(int $dayId, int $bellId, int $classId): bool
    {
        return isset($this->classSchedule[$dayId][$bellId]) && $this->classSchedule[$dayId][$bellId] === $classId;
    }
}
