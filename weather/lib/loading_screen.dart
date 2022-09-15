import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      LocationPermission permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: ElevatedButton(
          child: Text('GetLocation'),
          onPressed: () {
            getLocation();
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade900)),
        ),
      ),
    );
  }
}
