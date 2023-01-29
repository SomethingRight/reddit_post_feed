import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme, colorTheme }

  double initialFontSize = 18;
  bool toggledColor = true;
  bool toggledLight = false;
  bool toggledDark = false;

final Map<AppTheme, ThemeData> appThemeData = {
  // Light theme
  AppTheme.lightTheme: ThemeData(
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    splashColor: Colors.blueAccent,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),
    textTheme: textTheme(Colors.black).copyWith(
        headline1: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),

    // Dark theme
  ),
  AppTheme.darkTheme: ThemeData(
    primaryColor: Colors.black54,
    iconTheme: const IconThemeData(color: Colors.grey),
    splashColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ),
    textTheme: textTheme(Colors.white),

    // Color theme
  ),
  AppTheme.colorTheme: ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: Colors.black,
    splashColor: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    textTheme: textTheme(Colors.black),
  )
};

TextTheme textTheme(Color currentColor) {
  return TextTheme(
    headline1: TextStyle(
        color: currentColor, fontSize: 24, fontWeight: FontWeight.w500),
    headline2: TextStyle(
        color: currentColor,
        fontSize: initialFontSize + 4,
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: currentColor,
        fontSize: initialFontSize,
        fontWeight: FontWeight.w300),
    bodyText1: TextStyle(
        color: currentColor,
        fontSize: initialFontSize + 2,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: currentColor,
        fontSize: initialFontSize + 4,
        fontWeight: FontWeight.normal),
  );
}

