import 'dart:developer';

import 'package:balance_her/entity/entity.dart';

//здесь будет логика создания задач и их удаления
class TaskService {
  List<Task> _dailyTasks = [];
  List<Task> get dailyTasks => _dailyTasks;

  List<Task> _weeklyTasks = [];
  List<Task> get weeklyTasks => _weeklyTasks;

  int tabIndex = 0;
  final String taskName = '';
  void createTask(String name, TaskType taskType, TaskDuration taskDuration) {
    final date = DateTime.now();
    final task = Task(name: name, type: taskType, duration: taskDuration, date: date);
    log('Task created $task');
    _addTask(task);
  }

  void _addTask(Task task) {
    if (task.duration == TaskDuration.daily) {
      log('add daily task in service');
      _dailyTasks.add(task);
    } else {
      log('add weekly task in service');
      _weeklyTasks.add(task);
    }

    log('${dailyTasks.length} daily tasks and ${weeklyTasks.length} weekly tasks');
  }
}