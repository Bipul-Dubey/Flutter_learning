import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'task_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_Data.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context)=>SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child:AddTaskScreen()
                  )
              )
          );
        },
        child: const Icon(Icons.add,size: 35,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60,left: 30,right: 30,
            bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                    radius: 27,
                    child: Icon(Icons.menu,size: 32,color: Colors.lightBlueAccent,),
                ),
                const SizedBox(height: 10,),
                const Text(
                    "Todo",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "${context.watch<TaskData>().taskCount} Tasks",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight:  Radius.circular(25))
              ),
              child: TaskListView()
            ),
          )
        ],
      ),
    );
  }
}




