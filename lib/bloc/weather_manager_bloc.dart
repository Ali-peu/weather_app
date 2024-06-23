import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

part 'weather_manager_event.dart';
part 'weather_manager_state.dart';

class WeatherManagerBloc
    extends Bloc<WeatherManagerEvent, WeatherManagerState> {
      final WeatherRepository weatherRepository;
  WeatherManagerBloc({required this.weatherRepository}) : super(const WeatherManagerState()) {
    on<FetchInitialData>((event, emit) {});
    on<FetchCityForeCastDays>((event, emit) {});

  }
}
