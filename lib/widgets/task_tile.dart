import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack,
      required this.taskDelete});
  final Function taskDelete;
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: taskDelete as void Function()?,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontWeight: isChecked ? FontWeight.normal : FontWeight.bold,
          color: isChecked ? Colors.black87 : Colors.black,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.black,
        value: isChecked,
        onChanged: checkboxCallBack as void Function(bool?)?,
      ),
    );
  }
}
