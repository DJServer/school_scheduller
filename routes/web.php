<?php

use Illuminate\Support\Facades\Route;
use Livewire\Volt\Volt;
use App\Interface\Livewire\ScheduleTable;


Route::get('/', function () {
    return view('welcome');
})->name('home');


Route::middleware(['auth'])->group(function () {
    Route::redirect('settings', 'settings/profile');

    Volt::route('settings/profile', 'settings.profile')->name('settings.profile');
    Volt::route('settings/password', 'settings.password')->name('settings.password');
    Volt::route('settings/appearance', 'settings.appearance')->name('settings.appearance');
});

Route::get('dashboard', ScheduleTable::class)
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

require __DIR__.'/auth.php';
