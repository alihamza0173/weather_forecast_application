import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_forcast_application/core/models/weather.dart';
import 'package:weather_forcast_application/core/repositry/weather_repositry.dart';

class WeatherService extends WeatherRepositry {
  final Dio _dio = Dio();

  @override
  Future<Weather> getDetailedWeather(String cityName) {
    // TODO: implement getDetailedWeather
    throw UnimplementedError();
  }

  @override
  Future<Weather> getWeather(String cityName) async {
    throw UnimplementedError();
    // https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Lahore/2024-01-13/2024-01-18?key=FH62FMXZ6P4NXXEV7CG5DR6JV
    //   final response = await _dio.get(
    //     'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$latitude,$longitude/$date?key=FH62FMXZ6P4NXXEV7CG5DR6JV',
    //   );
    //   if (response.statusCode == 200) {
    //     return Weather.fromJson(json.decode(response.data));
    //   } else {
    //     throw Exception('Error fetching weather data');
    //   }
  }
}
