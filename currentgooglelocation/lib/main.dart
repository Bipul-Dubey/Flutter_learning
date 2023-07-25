import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main(){
  runApp(const MyGoogleApp());
}

class MyGoogleApp extends StatelessWidget {
  const MyGoogleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Google Map"),
          centerTitle: true,
        ),
        body: Screen(),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late bool serviceEnabled;
  late LocationPermission permission;

  Future<void> getLocation() async{
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print('Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // Position? position = await Geolocator.getLastKnownPosition();
    print("location-------------------------- $position");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: TextButton(
          onPressed: (){
            getLocation();
          }, child: Text("Get Location"),
        ),
      )
    );
  }
}

