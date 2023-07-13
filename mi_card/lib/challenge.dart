import 'package:flutter/material.dart';

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            color: Colors.red,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              )
            ],
          ),
          Container(
            width: 100,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
