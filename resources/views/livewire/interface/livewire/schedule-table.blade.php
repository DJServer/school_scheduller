<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Расписание занятий</h3>
        <button wire:click="generateSchedule" class="btn btn-primary">Сгенерировать заново</button>
    </div>

    <div class="row mb-3">
        <div class="col-md-4">
            <label class="form-label">Выберите день</label>
            <select wire:model.lazy="selectedDay" class="form-control">
                <option value="">Все дни</option>
                @foreach($days as $day)
                    <option value="{{ $day->getId() }}">{{ $day->getName() }}</option>
                @endforeach
            </select>
        </div>

        <div class="col-md-4">
            <label class="form-label">Выберите класс</label>
            <select wire:model.lazy="selectedClass" class="form-control">
                <option value="">Все классы</option>
                @foreach($classes as $class)
                    <option value="{{ $class->getId() }}">{{ $class->getName() }}</option>
                @endforeach
            </select>
        </div>

        <div class="col-md-4">
            <label class="form-label">Выберите учителя</label>
            <select wire:model.lazy="selectedTeacher" class="form-control">
                <option value="">Все учителя</option>
                @foreach($teachers as $teacher)
                    <option value="{{ $teacher->getId() }}">{{ $teacher->getName() }}</option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover table-bordered shadow-sm rounded">
            <thead class="table-dark">
            <tr>
                <th>День</th>
                <th>Время</th>
                <th>Класс</th>
                <th>Предмет</th>
                <th>Учитель</th>
            </tr>
            </thead>
            <tbody>
            @foreach($schedule as $lesson)
                <tr>
                    <td class="fw-bold">{{ $lesson->getDay()->getName() }}</td>
                    <td class="text-center">{{ $lesson->getBell()->getStartTime() }} - {{ $lesson->getBell()->getEndTime() }}</td>
                    <td class="text-center">{{ $lesson->getClass()->getName() }}</td>
                    <td>{{ $lesson->getSubject()->getName() }}</td>
                    <td>{{ $lesson->getTeacher()->getName() }}</td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>
