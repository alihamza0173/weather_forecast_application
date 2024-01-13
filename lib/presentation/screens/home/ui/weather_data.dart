import 'package:flutter/material.dart';
import 'package:weather_forcast_application/application/providers/weather_provider.dart';
import 'package:weather_forcast_application/presentation/screens/home/ui/today_weather.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({
    super.key,
    required this.provider,
  });

  final WeatherProvider provider;

  @override
  Widget build(BuildContext context) {
    final fiveDayWeather = provider.fiveDayssWeather;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        TodayWeather(weather: fiveDayWeather[0], textTheme: textTheme),
        const SizedBox(height: 22),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text('In 7 Days'),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Table(
                children: [
                  for (int index = 1; index < fiveDayWeather.length; index++)
                    TableRow(children: [
                      Text(
                        _getDayOfWeek(
                            DateTime.parse(fiveDayWeather[index].datetime)
                                .weekday),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(fiveDayWeather[index].weatherIcon,
                              height: 28),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              fiveDayWeather[index].weatherconditions,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      Text(
                          '${fiveDayWeather[index].temperatureCelsius.toStringAsFixed(0)}°'),
                      Text('${fiveDayWeather[index].windspeed}km/h')
                    ]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String _getDayOfWeek(int dayIndex) {
  switch (dayIndex) {
    case DateTime.monday:
      return 'Mon';
    case DateTime.tuesday:
      return 'Tue';
    case DateTime.wednesday:
      return 'Wed';
    case DateTime.thursday:
      return 'Thu';
    case DateTime.friday:
      return 'Fri';
    case DateTime.saturday:
      return 'Sat';
    case DateTime.sunday:
      return 'Sun';
    default:
      return '';
  }
}
