import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/custom_widgets.dart';
import 'package:flutter/material.dart';

class ResultBMI extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  const ResultBMI({super.key, required this.bmi, required this.result, required this.interpretation,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 25,left: 8),
              child: Text(
                "Your Result",
                style: zTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                cardColor: zActiveCardColor,
                onPress: (){},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: zResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      bmi,
                      style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    Text(
                      interpretation,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
            ),
          ),
          BottomButton(onPress: (){
            Navigator.pushNamed(context, '/');
          }, text: "RE-CALCULATE BMI")
        ],
      ),
    );
  }
}


