import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const apiKey = '70f3fcb21bf713780c09895b29369236';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location loc = Location();

    await loc.getCurrentLocation();
    print(loc.latitude);
    print(loc.longitude);
  }

  void getData() async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=London&appid=$apiKey");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = convert.jsonDecode(data);
      var temp = decodedData['main']['temp'];
      var condition = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];
      print(temp);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold();
  }
}
