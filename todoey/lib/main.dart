import 'package:flutter/material.dart';
import 'package:todoey/models/task_Data.dart';
import 'screens/todo_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodosScreen(),
      ),
    );
  }
}
