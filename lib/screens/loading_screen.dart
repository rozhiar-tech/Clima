import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }


  void getLocation() async{
    Location loc = Location();

    await loc.getCurrentLocation();
    print(loc.latitude);
    print(loc.longitude);

  }

  // ignore: non_constant_identifier_names
  void getData() async{


    // var URL =Uri.https('api.openweathermap.org', '/data/2.5/weather?lat=35.4689&lon=45.4988&appid=2989ab784c2e79ac26850e63288b8680');

    http.Response response = await http.get('');

    if(response.statusCode == 200){
      String data = response.body;
    }else{
      print(response.statusCode);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
