import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/models/city_model.dart';
import 'package:weather_app/domain/models/forecast_model.dart';

class CityPage extends StatelessWidget {
  final CityModel city;
  const CityPage({required this.city, super.key});

  String getDateFromString() {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    final dateTime = dateFormat.parse(city.localTime);
    return DateFormat.yMMMMEEEEd().format(dateTime);
  }

  String getDayAndMonthFromString(String dateTime) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    final date = dateFormat.parse(dateTime);
    return DateFormat.MEd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    final cityO = city.copyWith(forecastDays: [
      const ForecastModel(
          forecastDay: '2024-06-28 12:35:45',
          forecastMaxAvgTemperature: 20,
          forecastMinAvgTemperature: 18,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-29 12:35:45',
          forecastMaxAvgTemperature: 30,
          forecastMinAvgTemperature: 10,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-30 12:35:45',
          forecastMaxAvgTemperature: 25,
          forecastMinAvgTemperature: 12,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-28 12:35:45',
          forecastMaxAvgTemperature: 20,
          forecastMinAvgTemperature: 18,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-29 12:35:45',
          forecastMaxAvgTemperature: 30,
          forecastMinAvgTemperature: 10,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-30 12:35:45',
          forecastMaxAvgTemperature: 25,
          forecastMinAvgTemperature: 12,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-28 12:35:45',
          forecastMaxAvgTemperature: 20,
          forecastMinAvgTemperature: 18,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-29 12:35:45',
          forecastMaxAvgTemperature: 30,
          forecastMinAvgTemperature: 10,
          forecastDayIcon: ''),
      const ForecastModel(
          forecastDay: '2024-06-30 12:35:45',
          forecastMaxAvgTemperature: 25,
          forecastMinAvgTemperature: 12,
          forecastDayIcon: '')
    ]);
    return ColoredBox(
      color: Colors.transparent,
      child: Scaffold(
        appBar: AppBar(
            leading: const BackButton(),
            title: Text(city.cityName,
                style: Theme.of(context).textTheme.displayMedium),
            centerTitle: true),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Text('in sync',
                    style: Theme.of(context).textTheme.displaySmall)),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(getDateFromString(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.w300))),
            Text(
              '${city.currentTemperature.round()}°С',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Image.network(city.weatherConditionIconUrl,
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.width * 0.5),
            Text(city.weatherConditionText),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Cloud in per: ${city.cloud}%',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text('Wind ${city.windKmh} km/h',
                      style: Theme.of(context).textTheme.displaySmall)
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                child: Text('Daily Forecast',
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cityO.forecastDays.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(getDayAndMonthFromString(
                                cityO.forecastDays[index].forecastDay)),
                            Image.network(
                                '//cdn.weatherapi.com/weather/64x64/day/116.png'),
                            Row(
                              children: [
                                Image.asset('assets/images/up_arrow.png'),
                                Text(
                                    '${cityO.forecastDays[index].forecastMaxAvgTemperature}°С'),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/down_arrow.png'),
                                Text(
                                    '${cityO.forecastDays[index].forecastMinAvgTemperature}°С'),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
