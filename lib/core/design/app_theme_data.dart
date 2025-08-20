import 'package:flutter/material.dart';

abstract class AppThemeData {
  static final theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          minimumSize: const Size(0, 30),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.green,
      ),
  );
}