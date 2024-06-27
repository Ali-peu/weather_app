import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
      iconTheme: const IconThemeData(color: Colors.black),
      cardTheme: const CardTheme(shadowColor: Colors.transparent),
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.grey[800],
      listTileTheme: const ListTileThemeData(style: ListTileStyle.list),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          titleTextStyle: GoogleFonts.monda(
              textStyle: const TextStyle(fontSize: 35, color: Colors.black))),
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
  ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
    cardTheme: const CardTheme(shadowColor: Colors.transparent),
    cardColor: Colors.grey[950],
    listTileTheme: const ListTileThemeData(style: ListTileStyle.list),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      titleTextStyle: GoogleFonts.monda(

        textStyle: const TextStyle(fontSize: 35, color: Colors.white),
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.monda(
        textStyle: const TextStyle(fontSize: 50, color: Colors.white),
      ),
      displayLarge: GoogleFonts.monda(
        textStyle: const TextStyle(fontSize: 30, color: Colors.white),
      ),
      displaySmall: GoogleFonts.monda(
        textStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w100,
          color: Colors.white,
        ),
      ),
      displayMedium: GoogleFonts.monda(
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w200,
          color: Colors.white,
        ),
      ),
    ),
  );
}
