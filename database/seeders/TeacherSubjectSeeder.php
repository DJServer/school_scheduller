<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Infrastructure\Persistence\Eloquent\Models\TeacherModel;
use App\Infrastructure\Persistence\Eloquent\Models\SubjectModel;
use Illuminate\Support\Facades\DB;

class TeacherSubjectSeeder extends Seeder
{
    public function run(): void
    {
        $teachers = TeacherModel::all();
        $subjects = SubjectModel::all();

        foreach ($teachers as $teacher) {
            $randomSubjects = $subjects->random(rand(2, 3));
            foreach ($randomSubjects as $subject) {
                DB::table('teacher_subject')->insert([
                    'teacher_id' => $teacher->id,
                    'subject_id' => $subject->id,
                ]);
            }
        }
    }
}
