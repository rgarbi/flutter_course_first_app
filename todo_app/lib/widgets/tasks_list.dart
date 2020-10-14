import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              task: taskData.tasks[index],
              toggleCheckBox: () {
                //do something
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
