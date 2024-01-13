import 'package:flutter/material.dart';
import 'package:weather_forcast_application/application/router/app_router.dart';
import 'package:weather_forcast_application/application/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterSingleton.router,
      theme: AppTheme.lightTheme,
    );
  }
}
