import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forcast_application/application/application.dart';
import 'package:weather_forcast_application/application/injector.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Injector(child: MainApp()));
}
