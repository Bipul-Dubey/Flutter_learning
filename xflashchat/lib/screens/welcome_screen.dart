import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:xflashchat/screens/registration_screen.dart';
import 'login_screen.dart';
import 'package:xflashchat/custom_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String id ='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFirebase();

  }

  Future<void> initFirebase() async{
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black54
                  ),
                  child: AnimatedTextKit(
                    animatedTexts:[
                      TypewriterAnimatedText("Flash Chat")
                    ],
                    repeatForever: true,
                    pause: const Duration(seconds: 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                onPress: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                text: 'Log In'
            ),
            RoundedButton(
                color: Colors.blueAccent,
                onPress: (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                text: "Register")
          ],
        ),
      ),
    );
  }
}