
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather_app/bloc/weather_manager_bloc.dart';
import 'package:weather_app/ui/settings_page.dart';
import 'package:weather_app/ui/widgets/city_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.weather),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
                icon: const Icon(Icons.settings)),
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
                  return CityCard(city: state.listOfSity[index]);
                },
                itemCount: 3,
              );
            } else if (state.pageStatus == PageStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: [
                  Text(AppLocalizations.of(context)!.somethingWasGoneWrong)
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
