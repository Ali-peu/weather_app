import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/app_theme.dart';
import 'package:weather_app/bloc/weather_manager_bloc.dart';
import 'package:weather_app/data/weahter_api.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/ui/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      home: BlocProvider(
        create: (context) => WeatherManagerBloc(
            weatherRepository:
                WeatherRepository(weahterApi: WeatherApi(apiKey: ''))),
        child: const MainPage(),
      ),
    );
  }
}
