import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/models/forecast_model.dart';

class CityModel extends Equatable {
  final String cityName;
  final double currentTemperature;
  final String weatherConditionText;
  final String weatherConditionIconUrl;
  final double windKmh;
  final int cloud;
  final List<ForecastModel> forecastDays;
  final String localTime;

  const CityModel(
      {required this.cityName,
      required this.currentTemperature,
      required this.weatherConditionText,
      required this.weatherConditionIconUrl,
      required this.windKmh,
      required this.cloud,
      this.forecastDays = const [],
      required this.localTime});

  static CityModel fromJson(Map<String, dynamic> data) {
    final cityName = data['location']['name'] as String;
    final currentTemperature = (data['current']['temp_c'] as num).toDouble();
    final weatherConditionText = data['current']['condition']['text'] as String;
    final weatherConditionIconUrl =
        data['current']['condition']['icon'] as String;
    final windKmh = (data['current']['wind_kph'] as num).toDouble();
    final cloud = data['current']['cloud'] as int;
    final localTime = data['location']['localtime'] as String;

    return CityModel(
      cityName: cityName,
      currentTemperature: currentTemperature,
      weatherConditionText: weatherConditionText,
      weatherConditionIconUrl: weatherConditionIconUrl,
      windKmh: windKmh,
      cloud: cloud,
      localTime: localTime,
    );
  }

  CityModel copyWith(List<ForecastModel>? forecastDays) {
    return CityModel(
        cityName: cityName,
        currentTemperature: currentTemperature,
        weatherConditionText: weatherConditionText,
        weatherConditionIconUrl: weatherConditionIconUrl,
        windKmh: windKmh,
        forecastDays: forecastDays ?? this.forecastDays,
        cloud: cloud,
        localTime: localTime);
  }

  @override
  List<Object?> get props => [
        cityName,
        currentTemperature,
        weatherConditionIconUrl,
        weatherConditionText,
        windKmh,
        cloud,
        localTime
      ];
}
