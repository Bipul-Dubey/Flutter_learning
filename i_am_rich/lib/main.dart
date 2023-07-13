import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("I Am Rich"),
        ),
        body: Center(
          child: Image.asset('images/diamond.png'),
        ),
      ),
    ),
  );
}