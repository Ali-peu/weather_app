import 'dart:async';

import 'package:weather_app/data/weahter_api.dart';
import 'package:weather_app/domain/models/city_model.dart';

class WeatherRepository {
  final WeatherApi weahterApi;
  const WeatherRepository({required this.weahterApi});

  Future<CityModel?> getCurrentCityWeather({required String cityName}) async {
    try {
      final cityWeather = await weahterApi.getCurrentCityWeather(cityName);
      if (cityWeather != null) {
        return cityWeather;
      } else {
        throw Exception('The get weather is null, name: WeatherRepository');
      }
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}
