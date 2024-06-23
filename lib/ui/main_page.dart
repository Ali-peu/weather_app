import 'dart:math';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_manager_bloc.dart';
import 'package:weather_app/domain/models/city_model.dart';
import 'package:weather_app/ui/widgets/city_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cityModel = CityModel(
        cityName: 'Mumbai',
        currentTemperature: double.parse('${Random().nextInt(30) + 20}'),
        weatherConditionText: 'Sunny',
        weatherConditionIconUrl:
            '//cdn.weatherapi.com/weather/64x64/day/113.png',
        windKmh: 30,
        cloud: 10,
        localTime: '2024-06-23 12:35:45');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          )
        ],
      ),
      body: ColoredBox(
        color: Colors.transparent,
        child: EasyRefresh(
          onRefresh: () async {},
          child: BlocBuilder<WeatherManagerBloc, WeatherManagerState>(
              builder: (context, state) {
            if (state.pageStatus == PageStatus.success) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CityCard(city: cityModel);
                },
                itemCount: 3,
              );
            } else if (state.pageStatus == PageStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: const [
                  Text('Please update! Something was gone wrong')
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
