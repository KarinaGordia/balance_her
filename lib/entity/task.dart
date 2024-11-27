abstract class Task {
  Task({
    required this.name,
    required this.date,
    required this.type,
    // required this.duration,
  });

  final String name;
  final DateTime date;
  final TaskType type;
  // final TaskDuration duration;
  bool _isCompleted = false;

  bool get isCompleted => _isCompleted;

  void completeTask() {
    _isCompleted = !_isCompleted;
  }
}

enum TaskType {
  work,
  meetings,
  home,
}

// enum TaskDuration { daily, weekly }

class DailyTask extends Task {
  DailyTask({required super.name, required super.date, required super.type});
}

class WeeklyTask extends Task {
  WeeklyTask({required super.name, required super.date, required super.type});
}