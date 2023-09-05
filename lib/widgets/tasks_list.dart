import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app_flutter/widgets/task_tile.dart';
import 'package:to_do_app_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
  });

  @override
  State<TasksList> createState() => TasksListState();
}

class TasksListState extends State<TasksList> {
  Box taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskBox.listenable(),
      builder: (context, taskBox, child) {
        return ListView.builder(
          itemBuilder: (context, index) => TaskTile(
            taskDelete: () {
              taskBox.deleteAt(index);
            },
            taskTitle: taskBox.getAt(index).name,
            isChecked: taskBox.getAt(index).isDone,
            checkboxCallBack: (checkboxCallBack) {
              taskBox.putAt(
                  index,
                  Task(
                      name: taskBox.getAt(index).name,
                      isDone: checkboxCallBack));
            },
          ),
          itemCount: taskBox.length,
        );
      },
    );
  }
}
