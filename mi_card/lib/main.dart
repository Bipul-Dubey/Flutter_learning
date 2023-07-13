import 'package:flutter/material.dart';
import 'challenge.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body:SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                radius: 55.0,
                backgroundImage: AssetImage('images/profile_image.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
