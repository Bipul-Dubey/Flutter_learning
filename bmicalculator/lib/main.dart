 import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

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
      initialRoute: '/',
      routes: {
        "/": (context) => const InputPage(),
        '/result': (context) {
          final Map<String, String> data = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
          return ResultBMI(bmi: data['BMI']!,result: data['Result']!,interpretation: data['Interpretation']!,);
        }
      },
    );
  }
}

