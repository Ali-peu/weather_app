import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/domain/city_model.dart';

class WeahterApi {
  final String apiKey;
  WeahterApi({required this.apiKey});
  final Dio _dio = Dio();

  Future<CityModel?> getCurrentCityWeather() async {
    try {
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=Sholakkorgan&aqi=no');
      log(response.toString(), name: 'Response: ');

      if (response.statusCode == 200) {

        return CityModel.fromJson(response.data);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
