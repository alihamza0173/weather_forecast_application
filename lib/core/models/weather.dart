class Location {
  final String city;

  Location({required this.city});
}

class Weather {
  final String datetime;
  final double temperatureFahrenheit;
  final String weatherconditions;
  final double windspeed;
  final double humidity;
  final String weatherIcon;

  Weather({
    required this.datetime,
    required this.temperatureFahrenheit,
    required this.weatherconditions,
    required this.windspeed,
    required this.humidity,
    required this.weatherIcon,
  });

  double get temperatureCelsius => (temperatureFahrenheit - 32) * 5 / 9;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      datetime: json['datetime'],
      temperatureFahrenheit: json['temp'],
      weatherconditions: json['conditions'],
      windspeed: json['windspeed'],
      humidity: json['humidity'],
      weatherIcon: 'assets/weather_icons/${json['icon']}.png',
    );
  }
}
