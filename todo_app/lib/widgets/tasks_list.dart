import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function toggleDone;

  TasksList({@required this.tasks, this.toggleDone});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          task: tasks[index],
          toggleCheckBox: toggleDone,
        );
      },
      itemCount: tasks.length,
    );
  }
}
