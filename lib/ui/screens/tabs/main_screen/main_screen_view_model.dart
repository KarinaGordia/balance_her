import 'dart:developer';

import 'package:balance_her/entity/task.dart';
import 'package:balance_her/ui/screens/tabs/main_screen/task_service.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

//здесь будут функции, отвечающие за ui
//всё, что связано с задачами в чистом виде, будет в сервисе
class MainScreenViewModel extends ChangeNotifier {
  MainScreenViewModel({required this.primaryColor});

  final _taskService = TaskService();
  final Color primaryColor;

  final List<String> taskCategories = ['Work', 'Meetings', 'Home'];
  final List<String> taskDurationTypes = ['Daily', 'Weekly'];

  //String get today => formatDate(DateTime.now());

  var _taskTypeIndex = 0;
  int get taskTypeIndex => _taskTypeIndex;

  var _taskDurationIndex = 0;
  int get taskDurationIndex => _taskDurationIndex;

  final taskNameController = TextEditingController();

  int taskTypeTabIndex = 0;

  String formatDate(DateTime date) => DateFormat('dd.MM.yyyy').format(date);

  DateTime selectedDate = DateTime.now();

  String get selectedDateFormatted => formatDate(selectedDate);

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setTaskTypeIndex(int value) {
    _taskTypeIndex = value;
    notifyListeners();
  }

  void setTaskDurationIndex(int value) {
    _taskDurationIndex = value;
    notifyListeners();
  }

  void saveTask() {
    final name = taskNameController.text;
    log('task name: $name');
    final type = Task.getTypeByIndex(taskTypeTabIndex);
    log('type index: $taskTypeTabIndex, task type: ${type.name}');
    final duration = Task.getDurationByIndex(taskDurationIndex);
    log('duration index: $taskDurationIndex, task duration: ${duration.name}');
    if (name.isEmpty) {
      return;
    }

    _taskService.createTask(name, type, duration, selectedDate);

    //обнуляем диалог
    clearDialog();
  }

  void completeTask(Task task) {
    // task.completeTask();
    // notifyListeners();
  }

  void deleteTask(Task task) {
    //call task service
  }

  void clearDialog() {
    taskNameController.clear();
    _taskTypeIndex = 0;
    selectedDate = DateTime.now();
  }
}

