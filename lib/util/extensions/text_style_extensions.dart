import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/theme_extensions.dart';
import 'package:flutter_core/util/theme/colors.dart';
import 'package:flutter_core/util/theme/styles.dart';

extension TextStyleExtensions on BuildContext {
  TextStyle customStyle({
    double? textSize,
    FontStyle? style,
    FontWeight? weight,
    Color? color,
  }) =>
      textStyle(
        darkTheme: darkTheme(),
        size: textSize,
        style: style,
        weight: weight,
        color: color,
      );

  TextStyle customUnderlineStyle({
    double? textSize,
    FontStyle? style,
    FontWeight? weight,
    Color? color,
  }) =>
      underlineTextStyle(
        darkTheme: darkTheme(),
        size: textSize,
        style: style,
        weight: weight,
        color: color,
      );

  /// Appbar style
  TextStyle appbarStyle() => textStyle(
        darkTheme: darkTheme(),
        size: 20,
      );

  /// TextButton text style
  TextStyle textButtonStyle({
    required bool buttonStatus,
  }) =>
      textStyle(
        darkTheme: darkTheme(),
        size: 14,
        color: buttonStatus ? buttonColor : subtitleColor,
      );

  ///Main text style
  TextStyle bodyLargeStyle() =>
      textStyle(
        darkTheme: darkTheme(),
      );
}
