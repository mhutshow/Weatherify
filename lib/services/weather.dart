import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/location.dart';
const String apiKey = '14871f9b5419e7cce1c9b5f85311c20c';
class WeatherModel {
  Future<dynamic> getWeather() async{
    Location loc = Location();
    await loc.getLocation();
    NetworkHelper newtworkHelper= NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var networkData = await newtworkHelper.getData();
    return networkData;
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
