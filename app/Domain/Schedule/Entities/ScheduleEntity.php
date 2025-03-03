<?php

namespace App\Domain\Schedule\Entities;

use App\Domain\Class\Entities\ClassEntity;
use App\Domain\Teacher\Entities\TeacherEntity;
use App\Domain\Subject\Entities\SubjectEntity;
use App\Domain\Bell\Entities\BellEntity;
use App\Domain\Day\Entities\DayEntity;

class ScheduleEntity
{
    private ?int $id;
    private DayEntity $day;
    private BellEntity $bell;
    private ClassEntity $class;
    private SubjectEntity $subject;
    private TeacherEntity $teacher;

    public function __construct(
        ?int $id,
        DayEntity $day,
        BellEntity $bell,
        ClassEntity $class,
        SubjectEntity $subject,
        TeacherEntity $teacher
    ) {
        $this->id = $id;
        $this->day = $day;
        $this->bell = $bell;
        $this->class = $class;
        $this->subject = $subject;
        $this->teacher = $teacher;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDay(): DayEntity
    {
        return $this->day;
    }

    public function getBell(): BellEntity
    {
        return $this->bell;
    }

    public function getClass(): ClassEntity
    {
        return $this->class;
    }

    public function getSubject(): SubjectEntity
    {
        return $this->subject;
    }

    public function getTeacher(): TeacherEntity
    {
        return $this->teacher;
    }
}
