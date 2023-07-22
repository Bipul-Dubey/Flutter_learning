import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_widgets.dart';
import 'constants.dart';

enum Gender {male,female}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int currentHeightValue = 80;
  int currentWeightValue = 52;
  int currentAgeValue = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(
           child: Row(
             children: [
               Expanded(
                 child:  ReusableCard(
                   onPress: (){
                     setState(() {
                       selectedGender = Gender.male;
                     });
                   },
                   cardColor: selectedGender == Gender.male ? zActiveCardColor : zInactiveCardColor,
                   cardChild: const IconContent(
                     gender: "Male",
                     genderIcons: FontAwesomeIcons.mars,
                   ),
                 )
               ),
               Expanded(
                 child:  ReusableCard(
                   onPress: (){
                     setState(() {
                       selectedGender = Gender.female;
                     });
                   },
                   cardColor: selectedGender == Gender.female ? zActiveCardColor : zInactiveCardColor,
                   cardChild: const IconContent(
                     gender: "Female",
                     genderIcons: FontAwesomeIcons.venus,
                   ),
                 )
               )
             ],
           ),
         ),
          Expanded(
            child: ReusableCard(
              onPress: (){},
                cardColor: zActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: zLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        currentHeightValue.toString(),
                        style: zNumberTextStyle,
                      ),
                      const Text(
                          "cm",
                        style: zLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white70,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555) ,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 12.0
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0
                      )
                    ),
                    child: Slider(
                      value: currentHeightValue.toDouble(),
                      min: 50.0,
                      max: 250.0,
                      onChanged: (double newHeightValue){
                        setState(() {
                          currentHeightValue = newHeightValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child:  ReusableCard(
                      onPress: (){},
                      cardColor: zActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: zLabelTextStyle,
                          ),
                          Text(
                            currentWeightValue.toString(),
                            style: zNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    currentWeightValue--;
                                  });
                                },
                              ),
                              const SizedBox(width: 20,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    currentWeightValue++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                  Expanded(
                      child:  ReusableCard(
                        onPress: (){},
                        cardColor: zActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Age",
                              style: zLabelTextStyle,
                            ),
                            Text(
                              currentAgeValue.toString(),
                              style: zNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      currentAgeValue--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 20,),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      currentAgeValue++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top:6),
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
              color: zBottomCardColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8) ,topRight: Radius.circular(8))
            ),
          )
        ],
      )
    );
  }
}

