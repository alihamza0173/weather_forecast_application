import 'package:weather_forcast_application/core/models/weather.dart';

abstract class WeatherRepositry {
  Future<Weather> getWeather(String cityName);
  Future<Weather> getDetailedWeather(String cityName);
}
