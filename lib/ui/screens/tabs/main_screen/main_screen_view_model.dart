import 'package:balance_her/entity/task.dart';
import 'package:flutter/widgets.dart';

class MainScreenViewModel extends ChangeNotifier {
  MainScreenViewModel({required this.primaryColor});

  final Color primaryColor;

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

  List<Task> _dailyTasks = [];
  List<Task> get dailyTasks => _dailyTasks;

  List<Task> _weeklyTasks = [];
  List<Task> get weeklyTasks => _weeklyTasks;

  void createTask() {

  }

  void addTask(Task task) {


  }
}

