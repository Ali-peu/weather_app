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

  @override
  List<Object?> get props => [
        forecastDay,
        forecastDayIcon,
        forecastMaxAvgTemperature,
        forecastMinAvgTemperature
      ];
}
