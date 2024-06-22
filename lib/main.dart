import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/data/weahter_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final weahterApiKey = jsonDecode(
      await rootBundle.loadString('assets/keys.json'))['weather_api_key'];

  final WeatherApi api = WeatherApi(apiKey: weahterApiKey);

  final data = await api.getCurrentCityWeather('Almaty');
  if (data != null) {
    log('Data found!');

    debugPrint(data.toString());
  } else {
    log('Data not found!');
  }
  runApp(Container());
}
