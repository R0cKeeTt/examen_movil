import 'package:flutter/material.dart';

class MyTheme {
  static const Color primary = Color.fromARGB(255, 7, 204, 138);

  static final ThemeData myTheme = ThemeData(
      primaryColor: primary,
      brightness: Brightness.light,
      fontFamily: 'Releway',
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 25, 172, 11),
        elevation: 10,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 10, 156, 30))),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 2, 223, 119)));
}
