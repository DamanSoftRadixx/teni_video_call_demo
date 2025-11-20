import 'package:flutter/material.dart';
import '../constants/app_fonts.dart';
import 'color_schemes.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  static final TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 57,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    displayMedium: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    displaySmall: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    headlineLarge: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    titleLarge: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    titleMedium: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    titleSmall: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    labelLarge: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    labelMedium: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFonts.degular,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColorSchemes.lightColorScheme.onSurface,
    ),
  );
}
