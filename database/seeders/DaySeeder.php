<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Infrastructure\Persistence\Eloquent\Models\DayModel;

class DaySeeder extends Seeder
{
    public function run(): void
    {
        $days = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница'];

        foreach ($days as $day) {
            DayModel::create(['name' => $day]);
        }
    }
}
