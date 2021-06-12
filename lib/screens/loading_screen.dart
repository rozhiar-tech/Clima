import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '70f3fcb21bf713780c09895b29369236';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location loc = Location();

    await loc.getCurrentLocation();
    latitude = loc.latitude;
    longitude = loc.longitude;
    NetworkHelper networking = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
