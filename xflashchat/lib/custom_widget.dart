import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPress;
  final String text;
  const RoundedButton({super.key, required this.color, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
