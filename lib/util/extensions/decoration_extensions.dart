import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/theme_extensions.dart';

extension DecorationExtensions on BuildContext {

  /// BoxDecoration
  BoxDecoration containerDecoration({
    double? borderRadius,
    Color? fillColor,
    Color? borderColor,
  }) =>
      BoxDecoration(
        color: fillColor ?? currentTheme().backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        border: Border.all(
          width: 1,
          color: borderColor ?? currentTheme().hintColor,
        ),
      );


  ///Card decoration shape
  ShapeBorder cardShape({
    double? borderRadius,
  }) =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      );
}
