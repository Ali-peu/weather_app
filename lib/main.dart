import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: avoid_dynamic_calls
  final weahterApiKey = jsonDecode(
          await rootBundle.loadString('assets/keys.json'))['weather_api_key']
      as String;

  GoogleFonts.config.allowRuntimeFetching = false;
  // final data =
  //     await WeatherApi(apiKey: '').getCurrentCityWeather(cityName: 'Almaty');
  //     log(data.toString(),name: 'data: ');
  runApp(App(apiKey: weahterApiKey));
}
