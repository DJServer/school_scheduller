<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            ClassSeeder::class,
            TeacherSeeder::class,
            SubjectSeeder::class,
            DaySeeder::class,
            BellSeeder::class,
            TeacherSubjectSeeder::class, // Добавляем новый сидер
        ]);
    }

}
