import 'package:dio/dio.dart';
import 'package:weather_forcast_application/core/models/weather.dart';
import 'package:weather_forcast_application/core/repositry/weather_repositry.dart';

class WeatherService extends WeatherRepositry {
  final Dio _dio = Dio();

  @override
  Future<List<Weather>> getFiveDaysWeather(String cityName) async {
    //Date
    final DateTime now = DateTime.now();
    final String today = '${now.year}-${now.month}-${now.day}';
    final DateTime target = now.add(const Duration(days: 6));
    final String targetDate = '${target.year}-${target.month}-${target.day}';
    // Response
    final response = await _dio.get(
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$cityName/$today/$targetDate?key=FH62FMXZ6P4NXXEV7CG5DR6JV',
    );
    if (response.statusCode == 200) {
      final daysWeather = response.data['days'] as List;
      final weatherList = daysWeather.map((e) => Weather.fromJson(e)).toList();
      return weatherList;
    } else {
      throw Exception();
    }
  }
}
