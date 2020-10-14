import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function toggleCheckBox;
  final Function onLongPress;

  TaskTile({@required this.task, this.toggleCheckBox, this.onLongPress});

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
        onChanged: toggleCheckBox,
        value: task.isDone,
      ),
      onLongPress: onLongPress,
    );
  }
}
