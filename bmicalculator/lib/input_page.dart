import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const containerCardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
         Expanded(
           child: Row(
             children: [
               Expanded(
                 child:  ReusableCard(
                   cardColor: containerCardColor,
                   cardChild: IconContent(
                     gender: "Male",
                     genderIcons: FontAwesomeIcons.mars,
                   ),
                 )
               ),
               Expanded(
                 child:  ReusableCard(
                   cardColor: containerCardColor,
                   cardChild: IconContent(
                     gender: "Female",
                     genderIcons: FontAwesomeIcons.venus,
                   ),
                 )
               )
             ],
           ),
         ),
          const Expanded(
            child: ReusableCard(
                cardColor: containerCardColor,
              cardChild: Text(" "),
            )
          ),
          const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child:  ReusableCard(
                      cardColor: containerCardColor,
                      cardChild: Text(""),
                    )
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: containerCardColor,
                      cardChild: Text(""),
                    )
                  )
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top:6),
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xFFEB1555),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8) ,topRight: Radius.circular(8))
            ),
          )
        ],
      )
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;

  const ReusableCard({required this.cardChild, required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: cardChild,
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData genderIcons;
  late String gender;

  IconContent({super.key,required this.genderIcons,required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcons,
          size: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          gender,
          style: const TextStyle(
              fontSize: 20
          ),
        )
      ],
    );
  }
}

