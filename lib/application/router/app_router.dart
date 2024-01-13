import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_forcast_application/presentation/screens/home/home_screen.dart';
import 'package:weather_forcast_application/presentation/screens/search/search_screen.dart';

final appRouterSingleton = AppRouter();

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: const SearchScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child);
                });
          },
        ),
      ],
    );
  }
}
