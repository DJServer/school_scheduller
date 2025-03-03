<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Infrastructure\Persistence\Eloquent\Models\ClassModel;

class ClassSeeder extends Seeder
{
    public function run(): void
    {
        $classes = ['1-А', '1-Б', '2-А', '2-Б', '3-А', '3-Б', '4-А', '4-Б'];

        foreach ($classes as $class) {
            ClassModel::create(['name' => $class]);
        }
    }
}
