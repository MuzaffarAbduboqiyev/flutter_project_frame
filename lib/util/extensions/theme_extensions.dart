import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ThemeData currentTheme() => Theme.of(this);

  bool darkTheme() => MediaQuery.of(this).platformBrightness == Brightness.dark;
}
