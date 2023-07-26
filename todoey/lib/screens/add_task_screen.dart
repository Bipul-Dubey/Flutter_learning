import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_Data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight:  Radius.circular(25))
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
              ),
              TextField(
                controller: taskController,
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),
              TextButton(
                  onPressed: (){
                    context.read<TaskData>().addTask(taskController.text);
                    Navigator.pop(context);
                  },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightBlueAccent)
                ),
                  child: const Text(
                      "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
