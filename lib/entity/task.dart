class Task {
  Task({
    required this.name,
    required this.date,
    required this.type,
    required this.duration,
  });

  final String name;
  final DateTime date;
  final TaskType type;
  final TaskDuration duration;
  bool _isCompleted = false;

  bool get isCompleted => _isCompleted;

  void completeTask() {
    _isCompleted = !_isCompleted;
  }

  @override
  String toString() {
    return 'Task{name: $name, date: $date, type: $type, duration: $duration, _isCompleted: $_isCompleted}';
  }

  static TaskType getTypeByIndex(int index) {
    switch (index) {
      case 0:
        return TaskType.work;
      case 1:
        return TaskType.meetings;
      case 2:
        return TaskType.home;
      default:
        return TaskType.work;
    }
  }

  static TaskDuration getDurationByIndex(int index) {
    switch (index) {
      case 0:
        return TaskDuration.daily;
      case 1:
        return TaskDuration.weekly;
      default:
        return TaskDuration.daily;
    }
  }
}

enum TaskType {
  work,
  meetings,
  home,
}

enum TaskDuration { daily, weekly }
