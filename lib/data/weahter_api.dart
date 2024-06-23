import 'package:dio/dio.dart';
import 'package:weather_app/domain/models/city_model.dart';
import 'package:weather_app/domain/models/forecast_model.dart';

class WeatherApi {
  final String apiKey;
  WeatherApi({required this.apiKey});
  final Dio _dio = Dio();

  Future<CityModel?> getCurrentCityWeather(String cityName) async {
    try {
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName&aqi=no');

      if (response.statusCode == 200) {
        return CityModel.fromJson(response.data as  Map<String,dynamic>);
      } else {
        throw Exception(response);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ForecastModel>?> getForecastForCity(
      {required String cityName, int days = 3}) async {
    try {
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=7f885ebd7d5e42a199960954242206&q=$cityName&days=$days&aqi=no&alerts=no');
      if (response.statusCode == 200) {
        return []; // TODO return ForecastDays and decode them
      }else{
        throw Exception(response);
      }
    } on Exception catch (e) {
      // TODO
      throw Exception(e);
    }
  }
}
