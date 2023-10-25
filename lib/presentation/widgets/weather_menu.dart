import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/settings_menu.dart';

import '../screens/search_screen.dart';

class WeatherMenu extends StatelessWidget {
  final Function getWeather;

  const WeatherMenu({super.key, required this.getWeather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () async {
            final city =
                await Navigator.of(context).pushNamed(SearchScreen.routeName);
            if (city != null) {
              getWeather(city as String);
            }
          },
          icon: const Icon(
            CupertinoIcons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          },
          icon: const Icon(
            CupertinoIcons.settings,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
