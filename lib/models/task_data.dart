// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:collection';
import 'package:hive/hive.dart';

class TaskData extends ChangeNotifier {
  List<Task> _allTheTasks = [];
  Box taskBox = Hive.box<Task>('taskBox');
  UnmodifiableListView<Task> get allTheTasks {
    return UnmodifiableListView(_allTheTasks);
  }

  int get taskCount {
    return _allTheTasks.length;
  }

  int get taskBoxCount {
    return taskBox.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);
    _allTheTasks.add(task);
    taskBox.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    taskBox.putAt(taskBox.values.toList().indexOf(task), task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _allTheTasks.remove(task);
    taskBox.deleteAt(taskBox.values.toList().indexOf(task));
    notifyListeners();
  }
}
