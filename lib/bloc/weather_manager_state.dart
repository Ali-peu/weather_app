part of 'weather_manager_bloc.dart';

enum PageStatus { initial, loading, success, failure }

class WeatherManagerState extends Equatable {
  final PageStatus pageStatus;
  final List<CityModel> listOfSity;

  const WeatherManagerState({
    this.pageStatus = PageStatus.initial,
    this.listOfSity = const [],
  });

  WeatherManagerState copyWith({
    PageStatus? pageStatus,
    List<CityModel>? listOfSity,
  }) {
    return WeatherManagerState(
        pageStatus: pageStatus ?? this.pageStatus,
        listOfSity: listOfSity ?? this.listOfSity);
  }

  @override
  List<Object?> get props => [pageStatus, listOfSity];
}
