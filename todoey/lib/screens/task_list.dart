import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_Data.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {

        return ListView.builder(
          itemBuilder: (context, index){
            final task = taskData.tasks[index];
            return TaskListTile(
                isChecked: task.isDone,
                taskTitle: task.taskTitle,
                checkboxCallback: (value){
                  taskData.updateTask(task);
                },
              onLongPress: (){
                  taskData.deleteTask(task);
              },
            );
          },itemCount: taskData.taskCount,
        );
      },
    );
  }
}

class TaskListTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function() onLongPress;
  const TaskListTile({super.key, required this.isChecked, required this.taskTitle, required this.checkboxCallback, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        taskTitle,
        style: TextStyle(
            fontSize: 20,
            decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      )
    );
  }
}