import 'package:flutter/material.dart';
import 'package:weather_forcast_application/application/router/app_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouterSingleton.router,
    );
  }
}
