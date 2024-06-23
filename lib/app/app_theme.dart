import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
      cardTheme: const CardTheme(shadowColor: Colors.transparent),
      cardColor: Colors.white,
      listTileTheme: ListTileThemeData(style: ListTileStyle.list),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          
          titleTextStyle: GoogleFonts.monda(
              textStyle: const TextStyle(fontSize: 35, color: Colors.black))),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          titleLarge: GoogleFonts.monda(
              textStyle: const TextStyle(fontSize: 50, color: Colors.black)),
          displayLarge: GoogleFonts.monda(
              textStyle: const TextStyle(fontSize: 30, color: Colors.black)),
          displaySmall: GoogleFonts.monda(
              textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                  color: Colors.black)),
          displayMedium: GoogleFonts.monda(
              textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: Colors.black))));
}
