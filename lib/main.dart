import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/data/weahter_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final weahterApiKey = jsonDecode(
      await rootBundle.loadString('assets/keys.json'))['weather_api_key'];

  final WeahterApi api = WeahterApi(apiKey: weahterApiKey);

  final data = await api.getCurrentCityWeather();
  if (data != null) {
    debugPrint(data.toString());
  }
  runApp(Container());
}
