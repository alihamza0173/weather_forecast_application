import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forcast_application/application/service/weather_service.dart';
import 'package:weather_forcast_application/core/enums/weather_provider_status.dart';
import 'package:weather_forcast_application/core/models/weather.dart';
import 'package:weather_forcast_application/core/repositry/weather_repositry.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherRepositry _weatherRepositry;

  WeatherProvider(this._weatherRepositry);
  String _city = 'Lahore';
  List<Weather> _fiveDayssWeather = [];
  WeatherProviderStatus _status = WeatherProviderStatus.initial;
  String _errorMessage = '';

  String get city => _city;
  List<Weather> get fiveDayssWeather => _fiveDayssWeather;
  WeatherProviderStatus get status => _status;
  String get errorMessage => _errorMessage;

  Future<void> getWeather(String city) async {
    _status = WeatherProviderStatus.loading;
    _city = city;
    try {
      _fiveDayssWeather = await _weatherRepositry.getFiveDaysWeather(city);
      _status = WeatherProviderStatus.loaded;
    } catch (e) {
      _errorMessage = 'Error fetching weather data';
      _status = WeatherProviderStatus.error;
    }
    notifyListeners();
  }
}

final weatherProvider =
    ChangeNotifierProvider((ref) => WeatherProvider(WeatherService()));
