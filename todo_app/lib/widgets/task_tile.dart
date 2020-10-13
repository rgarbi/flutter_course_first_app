import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function toggleCheckBox;

  TaskTile({@required this.task, this.toggleCheckBox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: (value) {
          toggleCheckBox(value, task);
        },
        value: task.isDone,
      ),
    );
  }
}
