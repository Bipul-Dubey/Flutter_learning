import 'package:flutter/material.dart';
import 'challenge.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55.0,
                backgroundImage: AssetImage('images/profile_image.png'),
              ),
              const Text(
                "Bipul Dubey",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontFamily: 'SourceSans',
                  fontSize: 22,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.teal.shade50,
                indent: 120,
                endIndent: 120,
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: ListTile(
                    leading: Icon(
                        Icons.phone,
                    ),
                    title: Text(
                      "+91 123 1234 123",
                      style: TextStyle(
                        fontFamily: "SourceSans",
                        fontSize: 20
                      ),
                    ),
                  iconColor: Colors.teal,
                  textColor: Colors.teal,
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                  ),
                  title: Text(
                    "bipul@gmail.com",
                    style: TextStyle(
                        fontFamily: "SourceSans",
                        fontSize: 20
                    ),
                  ),
                  iconColor: Colors.teal,
                  textColor: Colors.teal,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
