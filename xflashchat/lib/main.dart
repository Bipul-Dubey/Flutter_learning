import 'package:flutter/material.dart';
import 'package:xflashchat/screens/chat_screen.dart';
import 'package:xflashchat/screens/login_screen.dart';
import 'package:xflashchat/screens/registration_screen.dart';
import 'package:xflashchat/screens/welcome_screen.dart';

void main(){
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        ChatScreen.id : (context) => ChatScreen(),
      },
    );
  }
}
