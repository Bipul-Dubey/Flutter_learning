import 'package:flutter/foundation.dart';
import 'task_model.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks= [
    Task(task: "task 1"),
    Task(task: "task 2")
  ];

  List<Task> get tasks{
    return _tasks;
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String taskText){
    final task = Task(task: taskText);
    _tasks.add(task);
    notifyListeners();
  }
}