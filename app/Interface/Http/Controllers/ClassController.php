<?php

namespace App\Interface\Http\Controllers;

use App\Domain\Class\Services\ClassService;
use Illuminate\Http\JsonResponse;

class ClassController
{
    private ClassService $classService;

    public function __construct(ClassService $classService)
    {
        $this->classService = $classService;
    }

    public function index(): JsonResponse
    {
        return response()->json($this->classService->getAllClasses());
    }
}
