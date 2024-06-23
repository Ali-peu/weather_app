import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/app/app.dart';
import 'package:weather_app/data/weahter_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: avoid_dynamic_calls
  // final weahterApiKey = jsonDecode( await rootBundle.loadString('assets/keys.json') )['weather_api_key'] as String;

  // final api = WeatherApi(apiKey: weahterApiKey);

  // final data = await api.getCurrentCityWeather('Almaty');
  // if (data != null) {
  //   log('Data found!');

  //   debugPrint(data.toString());
  // } else {
  //   log('Data not found!');
  // }
  runApp(const App());
}
