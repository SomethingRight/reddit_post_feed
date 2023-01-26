import 'package:flutter/material.dart';

ThemeData basicTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
      ),
      scaffoldBackgroundColor: Colors.grey.shade100,
      textTheme: textTheme());
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
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