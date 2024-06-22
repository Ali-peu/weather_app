import 'package:dio/dio.dart';
import 'package:weather_app/domain/models/city_model.dart';

class WeatherApi {
  final String apiKey;
  WeatherApi({required this.apiKey});
  final Dio _dio = Dio();

  Future<CityModel?> getCurrentCityWeather(String cityName) async {
    try {
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName&aqi=no');

      if (response.statusCode == 200) {
        return CityModel.fromJson(response.data);
      } else {
        throw Exception(response);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
