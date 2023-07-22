import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final VoidCallback onPress;

  const ReusableCard({super.key, required this.cardChild, required this.cardColor, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: cardChild,
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData genderIcons;
  final String gender;

  const IconContent({super.key,required this.genderIcons,required this.gender});

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
          style: zLabelTextStyle
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPress});

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      onPressed: onPress,
      elevation: 10.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
