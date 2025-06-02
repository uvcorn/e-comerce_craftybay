import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.getMaterialColor(AppColors.themeColor),
      ),
      textTheme: _textTheme,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        border: _getInputBorde(AppColors.themeColor),
        enabledBorder: _getInputBorde(AppColors.themeColor),
        focusedBorder: _getInputBorde(AppColors.themeColor),
        errorBorder: _getInputBorde(Colors.red),
        hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(
            fontSize: 16,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  static OutlineInputBorder _getInputBorde(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(color: color, width: 1.2));
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
      headlineMedium: TextStyle(fontSize: 16, color: Colors.grey),
    );
  }
}
