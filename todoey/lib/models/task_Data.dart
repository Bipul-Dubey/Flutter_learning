import 'package:flutter/foundation.dart';
import 'task_model.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  final List<Task> _tasks= [];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String taskText){
    final task = Task(taskTitle: taskText);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggle();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}