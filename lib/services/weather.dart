import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = '70f3fcb21bf713780c09895b29369236';
const openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCity(String cityName)async{
    var Url="https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(Url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather()async{
    // Location loc = Location();
    // await loc.getCurrentLocation();

    NetworkHelper networking = NetworkHelper(
        "$openWeatherMapUrl?lat=35.5558&lon=45.4351&appid=$apiKey&units=metric");
    var weatherData = await networking.getData();
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
