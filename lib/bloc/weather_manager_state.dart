part of 'weather_manager_bloc.dart';

enum PageStatus { initial, loading, success, failure }

class WeatherManagerState extends Equatable {
  final PageStatus pageStatus;

  const WeatherManagerState({
    this.pageStatus = PageStatus.success,
  });

  WeatherManagerState copyWith({
    PageStatus? pageStatus,
  }) {
    return WeatherManagerState(
      pageStatus: pageStatus ?? this.pageStatus,
    );
  }

  @override
  List<Object?> get props => [pageStatus];
}
