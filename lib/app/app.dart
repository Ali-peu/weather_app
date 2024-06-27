import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/app_locale.dart';
import 'package:weather_app/app/app_settings_notifier.dart';
import 'package:weather_app/bloc/weather_manager_bloc.dart';
import 'package:weather_app/data/weahter_api.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/ui/main_page.dart';

class App extends StatelessWidget {
  final String apiKey;
  const App({required this.apiKey, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppSettingsNotifier(),
        builder: (context, _) {
          final themeProvider = Provider.of<AppSettingsNotifier>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: themeProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocale().supportedLocales,
            theme: themeProvider.themeData,
            home: BlocProvider(
              create: (context) => WeatherManagerBloc(
                  weatherRepository:
                      WeatherRepository(weahterApi: WeatherApi(apiKey: apiKey)))
                ..add(FetchInitialData()),
              child: const MainPage(),
            ),
          );
        });
  }
}
