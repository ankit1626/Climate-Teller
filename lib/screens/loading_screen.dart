import 'package:climate_teller/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate_teller/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getdata() async {
    WeatherModel m1 = WeatherModel();
    var weatherdata = await m1.getweatherdata();
    print(weatherdata);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  data: weatherdata,
                )));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.pinkAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
