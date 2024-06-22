part of 'weather_manager_bloc.dart';

@immutable
sealed class WeatherManagerEvent  {}


class FetchInitialData extends WeatherManagerEvent{

}


class FetchCityForeCastDays  extends WeatherManagerEvent{
  final String cityName;

  FetchCityForeCastDays({required this.cityName});

}
