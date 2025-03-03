<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Infrastructure\Persistence\Eloquent\Models\SubjectModel;

class SubjectSeeder extends Seeder
{
    public function run(): void
    {
        $subjects = ['Математика', 'История', 'Литература', 'Физика', 'Химия', 'Биология', 'География'];

        foreach ($subjects as $subject) {
            SubjectModel::create(['name' => $subject]);
        }
    }
}
