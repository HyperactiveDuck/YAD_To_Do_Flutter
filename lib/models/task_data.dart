// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _allTheTasks = [];

  UnmodifiableListView<Task> get allTheTasks {
    return UnmodifiableListView(_allTheTasks);
  }

  int get taskCount {
    return _allTheTasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);
    _allTheTasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _allTheTasks.remove(task);
    notifyListeners();
  }
}
