import 'package:weather_app/auth/keys.dart';
import 'package:weather_app/models/weather_data.dart';

import 'networking.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<String> _getApiKey() async {
    Secret secret =
        await SecretLoader(secretPath: 'assets/secrets.json').load();
    return secret.apikey;
  }

  Future<WeatherData> getLocationWeather(lat, long) async {
    String key = await _getApiKey();

    var data = await NetworkHelper(
            '$openWeatherMapUrl?lat=$lat&lon=$long&appid=$key&units=imperial')
        .getData();

    double temperature = data['main']['temp'];
    int condition = data['weather'][0]['id'];
    String cityName = data['name'];
    return WeatherData(temperature, condition, cityName);
  }

  Future<WeatherData> getCityWeather(String city) async {
    String key = await _getApiKey();

    var data = await NetworkHelper(
            '$openWeatherMapUrl?q=$city&appid=$key&units=imperial')
        .getData();

    double temperature = data['main']['temp'];
    int condition = data['weather'][0]['id'];
    String cityName = data['name'];
    return WeatherData(temperature, condition, cityName);
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
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 68) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
