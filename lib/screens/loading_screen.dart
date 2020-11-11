import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {


  void getLocationData() async{

       var networkData= await WeatherModel().getWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData: networkData);
    }));

  }
  @override
  void initState() {
    super.initState();
    getLocationData();
    print ('i am ready');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}