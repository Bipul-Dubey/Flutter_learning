import 'package:flutter/material.dart';
import 'package:quizzee/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main(){
  runApp(MyQuizzes());
}

class MyQuizzes extends StatelessWidget {
  const MyQuizzes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: MyQuizzesPage(),
          ),
        ),
      ),
    );
  }
}

class MyQuizzesPage extends StatefulWidget {
  const MyQuizzesPage({super.key});

  @override
  State<MyQuizzesPage> createState() => _MyQuizzesPageState();
}

class _MyQuizzesPageState extends State<MyQuizzesPage> {
  List<Icon> scoreKeeper=[];

  void checkAnswer(bool userAnswer){
    bool correctAns = quizBrain.getAnswer();
    setState(() {
      if(quizBrain.isFinish()){
        Alert(
          context: context,
          title: 'You have reached the last question'
        ).show();
        scoreKeeper=[];
        quizBrain.reset();
      }
      else{
        if(correctAns==userAnswer){
          scoreKeeper.add(
              const Icon(
                Icons.check,
                color: Colors.green,
              )
          );
        }else{
          scoreKeeper.add(
              const Icon(
                Icons.close,
                color: Colors.red,
              )
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child:const Text(
                  "True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
              backgroundColor: Colors.red
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child:const Text(
                "False",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
            ),
          ),
        ),
        Row(
          children:scoreKeeper
        )
      ],
    );
  }
}


