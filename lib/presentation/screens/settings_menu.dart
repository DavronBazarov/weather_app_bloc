import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubit/settings/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = '/settings-menu';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListTile(
        title: const Text("Temperature unit"),
        subtitle: const Text("Celcius / Fahrenheit(default: celcius)"),
        trailing: Switch.adaptive(
          value: context.watch<SettingsCubit>().state.tempUnits ==
                  TempUnits.celsius
              ? true
              : false,
          activeTrackColor: Colors.deepOrange,
          activeColor: Colors.white,
          onChanged: (value) =>
              context.read<SettingsCubit>().toggleTemperature(),
        ),
      ),
    );
  }
}
