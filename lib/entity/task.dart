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

}

enum TaskType {
  work,
  meetings,
  home,
}

enum TaskDuration { daily, weekly }
