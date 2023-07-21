import 'package:flutter/material.dart';
import 'input_page.dart';

void main(){
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // Color(0xFF0A0E21)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
            color: Color(0xFF0A0E21),
          shadowColor: Colors.white
        )
      ),
      home: const InputPage(),
    );
  }
}

