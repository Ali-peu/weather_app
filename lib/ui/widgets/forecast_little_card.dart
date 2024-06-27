import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/app_settings_notifier.dart';
import 'package:weather_app/domain/models/forecast_model.dart';

class ForecastLittleCard extends StatelessWidget {
  final ForecastModel forecastWeather;
  const ForecastLittleCard({required this.forecastWeather, super.key});

  String getDayAndMonthFromString(
      String dateTime, AppSettingsNotifier appSettingsNotifier) {
    final dateFormat = DateFormat('yyyy-MM-dd');

    final date = dateFormat.parse(dateTime);
    return DateFormat.MEd(appSettingsNotifier.locale.languageCode).format(date);
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<AppSettingsNotifier>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(getDayAndMonthFromString(
              forecastWeather.forecastDay, settingsProvider)),
          Image.network('//cdn.weatherapi.com/weather/64x64/day/116.png'),
          Text('max: ${forecastWeather.forecastMaxAvgTemperature}°С',
              style: Theme.of(context).textTheme.displaySmall),
          Text('min: ${forecastWeather.forecastMinAvgTemperature}°С',
              style: Theme.of(context).textTheme.displaySmall),
        ],
      ),
    );
  }
}
