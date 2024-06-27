import 'package:dio/dio.dart';
import 'package:weather_app/domain/models/city_model.dart';

class WeatherApi {
  final String apiKey;
  WeatherApi({required this.apiKey});
  final Dio _dio = Dio();

  Future<CityModel?> getCurrentCityWeather(
      {required String cityName, int days = 10}) async {
    try {
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=$days&aqi=no&alerts=no');
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final needData2 = data['forecast'] as Map<String, dynamic>;

        final forecastDay = needData2['forecastday'] as List<dynamic>;

        final listForecast = List<Map<String, dynamic>>.from(forecastDay);

        return CityModel.fromJson(
            response.data as Map<String, dynamic>, listForecast);
      } else {
        throw Exception(response);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
