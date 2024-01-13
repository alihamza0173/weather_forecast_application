import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_forcast_application/application/providers/weather_provider.dart';
import 'package:weather_forcast_application/core/enums/weather_provider_status.dart';
import 'package:weather_forcast_application/presentation/screens/home/ui/weather_data.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(weatherProvider).getWeather('Lahore');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.city),
        centerTitle: true,
        leading: InkWell(
            onTap: () => context.push('/search'),
            child: const Icon(Icons.search)),
      ),
      body: provider.status == WeatherProviderStatus.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : provider.status == WeatherProviderStatus.loaded
              ? WeatherData(provider: provider)
              : provider.status == WeatherProviderStatus.error
                  ? Center(
                      child: Text(provider.errorMessage),
                    )
                  : const SizedBox.shrink(),
    );
  }
}
