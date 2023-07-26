import 'package:flutter/material.dart';
import 'package:xflashchat/custom_widget.dart';
import 'package:xflashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xflashchat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id ='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: email,
                  keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                  hintText : "Enter your email"
                )
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password"
                )
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Colors.lightBlueAccent,
                  onPress: () async{
                    setState(() {
                      spinner = true;
                    });
                    try{
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email.text,
                          password: password.text);
                      if(user!=null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        spinner = false;
                      });
                    }catch(e){
                      print(e);
                    }
                  },
                  text: "Log In"
              )
            ],
          ),
        ),
      ),
    );
  }
}