import 'package:balance_her/entity/task.dart';
import 'package:flutter/widgets.dart';

class MainScreenViewModel extends ChangeNotifier {
  var _taskTypeIndex = 0;
  int get taskTypeIndex => _taskTypeIndex;

  var _taskDurationIndex = 0;
  int get taskDurationIndex => _taskDurationIndex;

  void setTaskTypeIndex(int value) {
    _taskTypeIndex = value;
    notifyListeners();
  }

  void setTaskDurationIndex(int value) {
    _taskDurationIndex = value;
    notifyListeners();
  }

  List<DailyTask> _dailyTasks = [];
  List<WeeklyTask> _weeklyTasks = [];

  void addTask() {}
}

