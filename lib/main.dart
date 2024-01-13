import 'package:flutter/material.dart';
import 'package:weather_forcast_application/application/application.dart';
import 'package:weather_forcast_application/application/injector.dart';

void main() {
  runApp(const Injector(child: MainApp()));
}
