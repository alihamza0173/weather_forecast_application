import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_forcast_application/application/common/all_cities.dart';
import 'package:weather_forcast_application/application/providers/weather_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _suggestions = cities;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                // Handle suggestions based on the user input
                _updateSuggestions(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search City',
                hintText: 'Enter city name',
              ),
            ),
            const SizedBox(height: 16.0),
            _buildSuggestions(),
          ],
        ),
      ),
    );
  }

  void _updateSuggestions(String query) {
    setState(() {
      // Filter cities based on user input
      _suggestions = cities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildSuggestions() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _suggestions
              .map((suggestion) => ListTile(
                    title: Text(suggestion),
                    onTap: () {
                      // Handle the selection of a suggestion
                      _handleSelection(suggestion);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }

  void _handleSelection(String selectedCity) {
    ref.read(weatherProvider).getWeather(selectedCity);
    context.pop();
  }
}
