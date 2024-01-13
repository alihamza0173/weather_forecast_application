import 'package:weather_forcast_application/core/models/weather.dart';

abstract class WeatherRepositry {
  Future<List<Weather>> getFiveDaysWeather(String cityName);
}
