import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/weather.dart';
import '../../logic/cubit/settings/settings_cubit.dart';

class Temperature extends StatefulWidget {
  const Temperature({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  String _showTemperature(double temp) {
    final tempUnit = context.watch<SettingsCubit>().state.tempUnits;
    if (tempUnit == TempUnits.fahrenheit) {
      return "${(temp * 9 / 5 + 32).toStringAsFixed(0)} \u2109";
    }
    return "${temp.toStringAsFixed(0)} \u2103";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _showTemperature(widget.weather.temperature),
          style: const TextStyle(
            fontSize: 70,
            color: Colors.white,
            height: 0.5,
          ),
        ),
        Row(
          children: [
            Image.network(
              "https://openweathermap.org/img/wn/${widget.weather.icon}@2x.png",
              height: 60,
              width: 60,
            ),
            Text(
              widget.weather.main,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
