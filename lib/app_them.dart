import 'package:flutter/material.dart';

class MyAppTheme {
  MyAppTheme._();

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          brightness: Brightness.light),
      colorScheme: ColorScheme.light(
        primary: Colors.white,
        onPrimary: Colors.white,
        primaryVariant: Colors.white,
        secondary: Colors.red,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF6C63FF),
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        headline3: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ));

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Color(0xFF1E1E1E),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          color: Color(0xFF1E1E1E),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          brightness: Brightness.light),
      colorScheme: ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.black,
        primaryVariant: Colors.black,
        secondary: Colors.red,
      ),
      cardTheme: CardTheme(
        color: Color(0xFF1D1D1D),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF6C63FF),
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
        headline3: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ));
}
