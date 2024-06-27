import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/domain/models/city_model.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

part 'weather_manager_event.dart';
part 'weather_manager_state.dart';

class WeatherManagerBloc
    extends Bloc<WeatherManagerEvent, WeatherManagerState> {
  final WeatherRepository weatherRepository;
  WeatherManagerBloc({required this.weatherRepository})
      : super(const WeatherManagerState()) {
    on<FetchInitialData>((event, emit) async {
      try {
        final results = await Future.wait([
          weatherRepository.getCurrentCityWeather(cityName: 'Almaty'),
          weatherRepository.getCurrentCityWeather(cityName: 'Astana'),
          weatherRepository.getCurrentCityWeather(cityName: 'Yakutsk'),
        ]);

        log(results[0].toString(), name: 'result : ');
        if (results.contains(null)) {
          emit(state.copyWith(pageStatus: PageStatus.failure));
        } else {
          emit(state.copyWith(
            pageStatus: PageStatus.success,
            listOfSity: results.whereType<CityModel>().toList(),
          ));
        }
      } on Exception catch (error) {
        emit(state.copyWith(pageStatus: PageStatus.failure));
      }
    });
  }
}
