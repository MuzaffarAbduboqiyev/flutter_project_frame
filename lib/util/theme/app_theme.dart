/*
    displayLarge,
    displayMedium,
    displaySmall,
    headlineMedium,
    headlineSmall,
    titleLarge,
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelSmall,
   */
import 'package:flutter/material.dart';
import 'package:flutter_core/util/theme/colors.dart';
import 'package:flutter_core/util/theme/styles.dart';

class MyTheme {
  static ThemeData theme({required bool darkTheme}) {
    return ThemeData(
      brightness: darkTheme ? Brightness.dark : Brightness.light,
      dividerColor: dividerColor,
      backgroundColor: darkTheme ? backgroundColor : lightBackgroundColor,
      scaffoldBackgroundColor: darkTheme ? backgroundColor : lightBackgroundColor,
      indicatorColor: buttonColor,
      disabledColor: darkTheme ? disableButtonColor : lightDisableButtonColor,
      hintColor: darkTheme ? hintColor : lightHintColor,
      cardColor: darkTheme ? cardColor : lightCardColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: darkTheme ? textColor : lightTextColor,
        ),
        backgroundColor: appbarColor,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: buttonColor,
        selectedIconTheme: IconThemeData(
          color: buttonColor,
          size: 20,
        ),
        selectedLabelStyle: textStyle(
          darkTheme: false,
          color: buttonColor,
          size: 8,
        ),
        unselectedItemColor: darkTheme ? hintColor : lightHintColor,
        unselectedIconTheme: IconThemeData(
          color: darkTheme ? hintColor : lightHintColor,
        ),
        unselectedLabelStyle: textStyle(
          darkTheme: false,
          color: darkTheme ? hintColor : lightHintColor,
          size: 8,
        ),
        backgroundColor: appbarColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkTheme ? backgroundColor : lightBackgroundColor,
        labelStyle: textStyle(
          darkTheme: darkTheme,
          color: subtitleColor,
        ),
        hintStyle: textStyle(
          darkTheme: darkTheme,
          color: subtitleColor,
        ),
        prefixStyle: textStyle(
          darkTheme: darkTheme,
          color: subtitleColor,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorStyle: textStyle(
          darkTheme: darkTheme,
          size: 14,
          color: Colors.red,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: hintColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: hintColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: buttonColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      buttonTheme: ButtonThemeData(
        disabledColor: darkTheme ? disableButtonColor : lightDisableButtonColor,
        buttonColor: buttonColor,
      ),
    );
  }
}
