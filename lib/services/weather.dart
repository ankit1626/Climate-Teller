import 'package:climate_teller/services/networking.dart';
import 'package:climate_teller/services/location.dart';

//TODO:Get an api key from openweatherapi and paste the key below
const String apikey = '';
const String openweatherurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getweatherdata() async {
    Locationnn l1 = Locationnn();
    await l1.getcurrentlocation();
    Networkhelper n1 = Networkhelper(
        url:
            '$openweatherurl?lat=${l1.latitude}&lon=${l1.longitude}&appid=$apikey&units=metric');
    var weatherdata = await n1.getdata();
    return weatherdata;
  }

  Future<dynamic> getweatherdatausingcityname(var cityname) async {
    Networkhelper n1 = Networkhelper(
        url: '$openweatherurl?q=$cityname&appid=$apikey&units=metric');
    var weatherdata = await n1.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
