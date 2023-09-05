import 'package:flutter/material.dart';
import 'package:to_do_app_flutter/models/task_data.dart';
import 'package:to_do_app_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
  });

  @override
  State<TasksList> createState() => TasksListState();
}

class TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) => TaskTile(
            taskDelete: () {
              taskData.deleteTask(taskData.allTheTasks[index]);
            },
            taskTitle: taskData.allTheTasks[index].name,
            isChecked: taskData.allTheTasks[index].isDone,
            checkboxCallBack: (checkboxCallBack) {
              taskData.updateTask(taskData.allTheTasks[index]);
            },
          ),
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
