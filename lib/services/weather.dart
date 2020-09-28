import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const String appKey = '38bc0f148686270482d864e490e8cd4a';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    var weatherData = await NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?'
            'q=$cityName'
            '&appid=$appKey'
            '&units=metric').getWeather();
    print('Updated City Weather');
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getLocation();
    var weatherData = await NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?'
            'lat=${loc.latitude}'
            '&lon=${loc.longitude}'
            '&appid=$appKey'
            '&units=metric').getWeather();
    print('Updated Location Weather');
    return weatherData;
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
