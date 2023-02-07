// ignore_for_file: avoid_redundant_argument_values, avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'settings_storage.dart';

enum AppTheme { lightTheme, darkTheme, colorTheme }

abstract class Variables {
  static double initialFontSize = SettingsStorage.readFontSize();
  static AppTheme initialTheme = ThemeEnam().themeColorToEnum(SettingsStorage.readTheme());
  static bool toggledColor = true;
  static bool toggledLight = false;
  static bool toggledDark = false;
}
  

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
    textTheme: textThemeData(Colors.black).copyWith(
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
    textTheme: textThemeData(Colors.white),

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
    textTheme: textThemeData(Colors.black),
  )
};

TextTheme textThemeData(Color currentColor) {
  return TextTheme(
    headline1: TextStyle(
        color: currentColor, fontSize: 24, fontWeight: FontWeight.w500),
    headline2: TextStyle(
        color: currentColor,
        fontSize: Variables.initialFontSize + 4,
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: currentColor,
        fontSize: Variables.initialFontSize,
        fontWeight: FontWeight.w300),
    headline4: TextStyle(
        color: currentColor,
        fontSize: 24,
        fontWeight: FontWeight.w400),
    bodyText1: TextStyle(
        color: currentColor,
        fontSize: Variables.initialFontSize + 2,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: currentColor,
        fontSize: Variables.initialFontSize + 4,
        fontWeight: FontWeight.normal),
  );
}

class ThemeEnam {
   AppTheme themeColorToEnum(String themeColorStr) {
    switch (themeColorStr) {
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

  String themeColorFromEnum(AppTheme appTheme) {
    String? themeColorStr;
    switch (appTheme) {
      case AppTheme.colorTheme:
        {
          themeColorStr = 'color_theme';
          break;
        }

      case AppTheme.darkTheme:
        {
          themeColorStr = 'dark_theme';
          break;
        }
      case AppTheme.lightTheme:
        {
          themeColorStr = 'light_theme';
          break;
        }
      default:
        {
          themeColorStr = null;
        }
    }
    return themeColorStr!;
  }
}