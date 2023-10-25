import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:weather_app/logic/cubit/settings/settings_cubit.dart';

import 'package:weather_app/logic/repositories/weather_repository.dart';
import 'package:weather_app/logic/services/http/weather_api_services.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';
import 'package:weather_app/presentation/screens/settings_menu.dart';
import './presentation/screens/home_screen.dart';
import 'logic/cubit/weather/weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiServices: WeatherApiServices(
          client: Client(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => WeatherCubit(
              weatherRepository: ctx.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(
            create: (ctx) => SettingsCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
          routes: {
            SearchScreen.routeName: (context) => SearchScreen(),
            SettingsScreen.routeName: (context) => SettingsScreen(),
          },
        ),
      ),
    );
  }
}
