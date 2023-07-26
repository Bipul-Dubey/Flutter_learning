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
            return TaskListTile(
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].task,
                checkboxCallback: (value){
                  // setState(() {
                  //   context.read<TaskData>().tasks[index].toggle();
                  // });
                }
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
  const TaskListTile({super.key, required this.isChecked, required this.taskTitle, required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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