class Weather {
  final String cityName;
  final double temperatureCelsius;

  Weather({required this.cityName, required this.temperatureCelsius});

  double get temperatureFahrenheit => temperatureCelsius * 1.8 + 32;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temperatureCelsius: json['main']['temp'] - 273.15);
  }
}
