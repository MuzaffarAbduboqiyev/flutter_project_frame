import 'package:flutter/material.dart';
import 'package:flutter_core/util/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

TextStyle textStyle({
  required bool darkTheme,
  double? size,
  FontStyle? style,
  FontWeight? weight,
  Color? color,
}) {
  return GoogleFonts.roboto(
    fontSize: (size ?? 16.0).sp,
    fontStyle: style ?? FontStyle.normal,
    fontWeight: weight ?? FontWeight.w500,
    color: color ?? (darkTheme ? textColor : lightTextColor),
  );
}

TextStyle underlineTextStyle({
  required bool darkTheme,
  double? size,
  FontStyle? style,
  FontWeight? weight,
  Color? color,
}) {
  return GoogleFonts.roboto(
    decoration: TextDecoration.underline,
    fontSize: (size ?? 16.0).sp,
    fontStyle: style ?? FontStyle.normal,
    fontWeight: weight ?? FontWeight.w500,
    color: color ?? (darkTheme ? textColor : lightTextColor),
  );
}
