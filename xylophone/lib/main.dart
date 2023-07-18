import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main(){
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int num) async{
    final player = AudioPlayer();
    await player.setVolume(5);
    await player.setSource(AssetSource('note$num.wav'));
    await player.resume();
  }

  Expanded soundButton({required int num,required Color color}){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor:color
        ),
        onPressed: () {
          playSound(num);
        }, child: const Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              soundButton(num: 1,color: Colors.red),
              soundButton(num: 2,color: Colors.orange),
              soundButton(num: 3,color: Colors.yellow),
              soundButton(num: 4,color: Colors.green),
              soundButton(num: 5,color: Colors.teal),
              soundButton(num: 6,color: Colors.blue),
              soundButton(num: 7,color: Colors.purple),
            ],
          )
        ),
      ),
    );
  }
}
