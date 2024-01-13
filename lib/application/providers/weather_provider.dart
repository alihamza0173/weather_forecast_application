import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherProvider extends ChangeNotifier {}

final weatherProvider = ChangeNotifierProvider((ref) => WeatherProvider());
