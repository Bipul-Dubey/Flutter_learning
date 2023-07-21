import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(MyWebPage());
}

class MyWebPage extends StatefulWidget {
  const MyWebPage({super.key});

  @override
  State<MyWebPage> createState() => _MyWebPageState();
}

class _MyWebPageState extends State<MyWebPage> {
  final Uri instagramLoginURL = Uri.parse("https://www.instagram.com/accounts/login/");

  void _openInstagramLoginPage() async {
    if (await canLaunchUrl(instagramLoginURL)) {
      await launchUrl(instagramLoginURL);
    } else {
      // Handle error: Unable to launch the URL
      print("Error: Could not launch $instagramLoginURL");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
        child: ElevatedButton(
        onPressed: _openInstagramLoginPage,
        child: Text("Open Instagram Login Page"),
    ),
        ),
      ),
    ),
    );
  }
}
