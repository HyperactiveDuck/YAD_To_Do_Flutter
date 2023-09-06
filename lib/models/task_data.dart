// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'task.dart';

import 'package:hive/hive.dart';

class TaskData extends ChangeNotifier {
  Box<Task> taskBox = Hive.box<Task>('taskBox');

  int get taskBoxCount {
    return taskBox.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);

    taskBox.add(task);
    notifyListeners();
  }

  void deleteTask(int index) async {
    await taskBox.values.elementAt(index).delete();
    taskBox.values.elementAt(index).save();
    debugPrint(taskBox.values.length
        .toString()); // taskBox.deleteAt(taskBox.values.toList().indexOf(task));
    notifyListeners();
  }

  void updateCheckbox(int index) {
    bool isDone = taskBox.values.elementAt(index).isDone;
    taskBox.values.elementAt(index).isDone = !isDone;
    taskBox.values.elementAt(index).save();
    notifyListeners();
  }
}
