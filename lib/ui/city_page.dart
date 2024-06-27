import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/app_settings_notifier.dart';
import 'package:weather_app/domain/models/city_model.dart';
import 'package:weather_app/ui/widgets/forecast_little_card.dart';

class CityPage extends StatelessWidget {
  final CityModel city;
  const CityPage({required this.city, super.key});

  String getDateFromString(AppSettingsNotifier appSettingsNotifier){
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    final dateTime = dateFormat.parse(city.localTime);
    return DateFormat.yMMMMEEEEd(appSettingsNotifier.locale).format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
        final settingsProvider = Provider.of<AppSettingsNotifier>(context);

    return ColoredBox(
      color: Colors.transparent,
      child: Scaffold(
        appBar: AppBar(
            leading: const BackButton(),
            title: Text(city.cityName,
                style: Theme.of(context).textTheme.displayMedium),
            centerTitle: true),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Align(
                  child: Text(AppLocalizations.of(context)!.inSync,
                      style: Theme.of(context).textTheme.displaySmall),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Align(
                  child: Text(getDateFromString(settingsProvider),
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w300)),
                )),
            Align(
              child: Text(
                '${city.currentTemperature.round()}°С',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Align(
              child: Image.network(city.weatherConditionIconUrl,
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.width * 0.5),
            ),
            Align(child: Text(city.weatherConditionText)),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.cloudInPer}: ${city.cloud}%',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                        '${AppLocalizations.of(context)!.wind}: ${city.windKmh}${AppLocalizations.of(context)!.windKMH}',
                        style: Theme.of(context).textTheme.displaySmall)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                child: Text(AppLocalizations.of(context)!.dailyForecast,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: city.forecastDays.length,
                    itemBuilder: (context, index) {
                      return ForecastLittleCard(
                          forecastWeather: city.forecastDays[index]);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
