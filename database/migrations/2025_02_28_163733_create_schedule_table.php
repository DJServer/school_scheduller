<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('schedule', function (Blueprint $table) {
            $table->id();
            $table->foreignId('day_id')->constrained('days')->onDelete('cascade');
            $table->foreignId('bell_id')->constrained('bells')->onDelete('cascade');
            $table->foreignId('class_id')->constrained('classes')->onDelete('cascade');
            $table->foreignId('subject_id')->constrained('subjects')->onDelete('cascade');
            $table->foreignId('teacher_id')->constrained('teachers')->onDelete('cascade');
            $table->timestamps();

            // Уникальный ключ для предотвращения конфликтов
            $table->unique(['day_id', 'bell_id', 'class_id']); // Один класс не может быть у двух учителей одновременно
            $table->unique(['day_id', 'bell_id', 'teacher_id']); // Один учитель не может вести два урока одновременно
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('schedule');
    }
};
