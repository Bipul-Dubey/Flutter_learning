import 'dart:math';

class BmiCalculator{
  final int weight;
  final int height;
  late final double _bmi;

  BmiCalculator({required this.weight, required this.height});

  String calculateBmi(){
    _bmi =  weight / pow(height/100,2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult(){
    if(_bmi < 16){
      return "Underweight \n(Severe thinness)";
    }
    else if( _bmi >= 16 && _bmi < 17){
      return "Underweight \n(Moderate thinness)";
    }
    else if(_bmi >= 17 && _bmi < 18.4){
      return "Underweight \n(Mild thinness)";
    }
    else if(_bmi >= 18.5 && _bmi < 24.9){
      return "Normal";
    }
    else if(_bmi >= 25.0 && _bmi < 29.9){
      return "Overweight \n(Pre-obese)";
    }
    else if(_bmi >= 30.0 && _bmi < 34.9){
      return "Obese \n(Class I)";
    }
    return "Obese \n(Class II)";
  }

  String getInterpretation(){
    if(_bmi < 16){
      return "Visit Doctor, Concern with your Dietitian, Eat healthy diet, Relax.";
    }
    else if( _bmi >= 16 && _bmi < 17){
      return "Visit Doctor, Eat healthy diet, Relax.";
    }
    else if(_bmi >= 17 && _bmi < 18.4){
      return "Focus on a nutrient-rich diet to gain weight healthily.";
    }
    else if(_bmi >= 18.5 && _bmi < 24.9){
      return "Maintain a balanced diet and regular exercise for overall health.";
    }
    else if(_bmi >= 25.0 && _bmi < 29.9){
      return "Slightly higher than normal, gradually lose weight through portion control and increased physical activity.";
    }
    else if(_bmi >= 30.0 && _bmi < 34.9){
      return "Seek professional guidance for weight management and exercise regularly.";
    }
    return "Prioritize medical support and lifestyle changes for weight management.";
  }

}