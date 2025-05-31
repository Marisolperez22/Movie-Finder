import 'package:flutter/material.dart';
import 'package:password_app/design/password_app_colors.dart';

class PasswordAppTheme {
  PasswordAppTheme._();

  static ThemeData defaulTheme = ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: PasswordAppColors.primaryColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 10),
      bodyMedium: TextStyle(fontSize: 14),
      displayLarge: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 21.0,
        color: PasswordAppColors.primaryColor,
      ),
    ),
  );
}
