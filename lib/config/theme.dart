import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme, colorTheme }

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    splashColor: Colors.blueAccent,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),
    textTheme: textTheme().copyWith(
        headline1: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
  ),
  AppTheme.darkTheme: ThemeData(
    primaryColor: Colors.black54,
    iconTheme: const IconThemeData(color: Colors.grey),
    splashColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ),
    textTheme: ligthTextTheme(),
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
      textTheme: textTheme()),
};

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
    headline2: TextStyle(
        color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w300),
    bodyText1: TextStyle(
        color: Colors.black54, fontSize: 20, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Colors.black54, fontSize: 22, fontWeight: FontWeight.normal),
  );
}

TextTheme ligthTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
    headline2: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
    bodyText1: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.normal),
  );
}
