import 'package:flutter/foundation.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [];

  int get taskCount {
    return tasks.length;
  }
}
