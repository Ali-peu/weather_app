import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'weather_manager_event.dart';
part 'weather_manager_state.dart';

class WeatherManagerBloc
    extends Bloc<WeatherManagerEvent, WeatherManagerState> {
  WeatherManagerBloc() : super(const WeatherManagerState()) {
    on<FetchInitialData>((event, emit) {});
    on<FetchCityForeCastDays>((event, emit) {});

  }
}
