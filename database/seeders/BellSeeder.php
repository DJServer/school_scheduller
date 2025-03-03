<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Infrastructure\Persistence\Eloquent\Models\BellModel;

class BellSeeder extends Seeder
{
    public function run(): void
    {
        $bells = [
            ['name' => 'Первый урок', 'start_time' => '08:00:00', 'end_time' => '08:45:00', 'is_break' => 0],
            ['name' => 'Перемена', 'start_time' => '08:45:00', 'end_time' => '09:00:00', 'is_break' => 1],
            ['name' => 'Второй урок', 'start_time' => '09:00:00', 'end_time' => '09:45:00', 'is_break' => 0],
            ['name' => 'Перемена', 'start_time' => '09:45:00', 'end_time' => '10:00:00', 'is_break' => 1],
            ['name' => 'Третий урок', 'start_time' => '10:00:00', 'end_time' => '10:45:00', 'is_break' => 0],
            ['name' => 'Перемена', 'start_time' => '10:45:00', 'end_time' => '11:00:00', 'is_break' => 1],
            ['name' => 'Четвертый урок', 'start_time' => '11:00:00', 'end_time' => '11:45:00', 'is_break' => 0],
            ['name' => 'Перемена', 'start_time' => '11:45:00', 'end_time' => '12:00:00', 'is_break' => 1],
            ['name' => 'Пятый урок', 'start_time' => '12:00:00', 'end_time' => '12:45:00', 'is_break' => 0],
        ];
        foreach ($bells as $bell) {
            BellModel::create($bell);
        }
    }
}
