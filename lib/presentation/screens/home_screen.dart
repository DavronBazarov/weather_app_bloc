import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/widgets/weather_menu.dart';

import '../../logic/cubit/weather/weather_cubit.dart';
import '../widgets/city_part.dart';
import '../widgets/temperature.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    _getWeather("london");
    super.initState();
  }

  void _getWeather(String city) {
    context.read<WeatherCubit>().getWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherCubit, WeatherState>(
        builder: (ctx, state) {
          if (state is WeatherInitial) {
            return const Center(
              child: Text("Select city"),
            );
          }
          if (state is WeatherLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is WeatherLoaded) {
            final weather = state.weather;
            final mainWeather = weather.main.toLowerCase();
            String imagePath = '';
            if (mainWeather.contains("rain")) {
              imagePath = 'assets/rainy.jpg';
            } else if (mainWeather.contains("sun")) {
              imagePath = 'assets/sunny.jpg';
            } else if (mainWeather.contains("cloud")) {
              imagePath = 'assets/cloudy.jpg';
            } else {
              imagePath = 'assets/night.jpg';
            }
            return Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.black.withOpacity(0.4),
                ),
                Positioned(
                  right: 5,
                  top: 40,
                  child: WeatherMenu(getWeather: _getWeather),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CityPart(weather: weather),
                        Temperature(weather: weather),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
        listener: (ctx, state) async {
          if (state is WeatherError) {
            await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("ERROR"),
                content: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("ok"),
                  ),
                ],
              ),
            );

            if (state.message.toLowerCase().contains("not found")) {
              _getWeather("london");
            }
          }
        },
      ),
    );
  }
}
