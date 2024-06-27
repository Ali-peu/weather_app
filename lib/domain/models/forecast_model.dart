import 'package:equatable/equatable.dart';

class ForecastModel extends Equatable {
  final String forecastDay;
  final double forecastMaxAvgTemperature;
  final double forecastMinAvgTemperature;

  final String forecastDayIcon;

  const ForecastModel(
      {required this.forecastDay,
      required this.forecastMaxAvgTemperature,
      required this.forecastMinAvgTemperature,
      required this.forecastDayIcon});

  static ForecastModel fromJson(Map<String, dynamic> data) {
    return ForecastModel(
        forecastDay: (data['date']) as String,
        forecastMaxAvgTemperature:
            (data['day'] as Map<String, dynamic>)['maxtemp_c'] as double,
        forecastMinAvgTemperature:
            (data['day'] as Map<String, dynamic>)['mintemp_c'] as double,
        forecastDayIcon: 'https:${((data['day'] as Map<String, dynamic>)['condition']
            as Map<String, dynamic>)['icon'] as String}');
  }

  @override
  List<Object?> get props => [
        forecastDay,
        forecastDayIcon,
        forecastMaxAvgTemperature,
        forecastMinAvgTemperature
      ];
}
