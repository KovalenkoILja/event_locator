import 'package:flutter/material.dart';

final ThemeData _theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color.fromARGB(255, 47, 45, 62),
  accentColor: Color.fromARGB(255, 91, 110, 208),
);

ThemeData getThemeData(context) {
  return _theme;
}
