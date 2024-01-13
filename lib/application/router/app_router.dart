import 'package:go_router/go_router.dart';
import 'package:weather_forcast_application/presentation/screens/home/home_screen.dart';

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
      ],
    );
  }
}
