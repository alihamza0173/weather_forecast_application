import 'package:flutter/material.dart';
import 'package:weather_forcast_application/core/models/weather.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({
    super.key,
    required this.weather,
    required this.textTheme,
  });

  final Weather weather;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Weather Icon and Temperature
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              weather.weatherIcon,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: textTheme.headlineSmall,
                ),
                Text(
                  weather.weatherconditions,
                  style: textTheme.labelSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  '${weather.temperatureCelsius.toStringAsFixed(0)}°',
                  style: textTheme.displayLarge
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 18),
        // Wind , Humidity
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Temp\n${weather.temperatureCelsius.toStringAsFixed(0)}°'),
            Text('Wind\n${weather.windspeed}km/h'),
            Text('Wind\n${weather.humidity}%'),
          ],
        ),
      ],
    );
  }
}
