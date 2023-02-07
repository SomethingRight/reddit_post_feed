// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

import 'settings_storage.dart';

enum AppTheme { lightTheme, darkTheme, colorTheme }



  double initialFontSize = SettingsStorage.readFontSize();
  AppTheme initialTheme = ThemeEnam().themeColorLogicToEnum(SettingsStorage.readTheme());
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
    primaryColor: Colors.grey,
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
    headline4: TextStyle(
        color: currentColor,
        fontSize: 24,
        fontWeight: FontWeight.w400),
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

class ThemeEnam {
   AppTheme themeColorLogicToEnum(String themeColorLogicStr) {
    switch (themeColorLogicStr) {
      case 'color_theme':
        {
          return AppTheme.colorTheme;
        }
      case 'dark_theme':
        {
          return AppTheme.darkTheme;
        }
      case 'light_theme':
        {
          return AppTheme.lightTheme;
        }
      default:
        {
          return AppTheme.colorTheme;
        }
    }
  }

  String themeColorLogicFromEnum(AppTheme appTheme) {
    String? themeColorLogicStr;
    switch (appTheme) {
      case AppTheme.colorTheme:
        {
          themeColorLogicStr = 'color_theme';
          break;
        }

      case AppTheme.darkTheme:
        {
          themeColorLogicStr = 'dark_theme';
          break;
        }
      case AppTheme.lightTheme:
        {
          themeColorLogicStr = 'light_theme';
          break;
        }
      default:
        {
          themeColorLogicStr = null;
        }
    }
    return themeColorLogicStr!;
  }
}