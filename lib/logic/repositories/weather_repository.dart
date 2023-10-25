import 'package:weather_app/logic/services/http/weather_api_services.dart';

import '../../data/models/weather.dart';

class WeatherRepository{
  final WeatherApiServices weatherApiServices;
  WeatherRepository({required this.weatherApiServices});

  Future<Weather> getWeather(String city) async{
    return weatherApiServices.getWeather(city);
}
}