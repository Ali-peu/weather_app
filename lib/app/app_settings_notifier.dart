import 'package:flutter/material.dart';
import 'package:weather_app/app/app_locale.dart';
import 'package:weather_app/app/app_theme.dart';

class AppSettingsNotifier extends ChangeNotifier{
  ThemeData themeData = AppTheme().lightTheme;

  Locale locale = AppLocale().supportedLocales[0];

  void changeLocale(){
    if(locale == AppLocale().supportedLocales[0]){
      locale = AppLocale().supportedLocales[1];
    }else{
      locale = AppLocale().supportedLocales[0];

    }
    notifyListeners();
  }



  void changeTheme(){
    if(themeData  == AppTheme().lightTheme){
      themeData = AppTheme().darkTheme;
    }else{
      themeData = AppTheme().lightTheme;
    }
    notifyListeners();
  }

}