import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.grey[900],
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    ),
  );
}
