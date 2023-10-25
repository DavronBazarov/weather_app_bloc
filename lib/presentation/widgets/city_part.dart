import 'package:flutter/material.dart';
import 'package:weather_app/helpers/string_extensions.dart';

import '../../data/models/weather.dart';

class CityPart extends StatelessWidget {
  const CityPart({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.city.capitalizeString(),
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          weather.desc,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}