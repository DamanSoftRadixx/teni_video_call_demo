import 'package:flutter/material.dart';

class AppColorSchemes {
  // Private constructor to prevent instantiation
  AppColorSchemes._();

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6C63FF), // Vibrant purple-blue
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEDE7FF), // Soft purple background
    onPrimaryContainer: Color(0xFF2D1A7F),
    secondary: Color(0xFF00BFAE), // Teal accent
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD0F8F6), // Soft teal background
    onSecondaryContainer: Color(0xFF00332C),
    tertiary: Color(0xFFFFB300), // Warm gold accent
    onTertiary: Color(0xFF332100),
    tertiaryContainer: Color(0xFFFFF3E0),
    onTertiaryContainer: Color(0xFF4A3200),
    error: Color(0xFFE53935), // Red for errors
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFE5E5),
    onErrorContainer: Color(0xFFB71C1C),
    surface: Color(0xFFF8F9FB), // Soft, light background
    onSurface: Color(0xFF23233C), // Deep blue-gray for text
    surfaceContainerHighest: Color(0xFFE3E1EC),
    outline: Color(0xFFB0B3C6), // Muted blue-gray
    shadow: Color(0xFF000000),
    inverseSurface: Color(0xFF23233C),
    onInverseSurface: Color(0xFFF8F9FB),
    inversePrimary: Color(0xFFB3B8FF),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFB3B8FF), // Lighter purple-blue
    onPrimary: Color(0xFF23233C),
    primaryContainer: Color(0xFF2D1A7F),
    onPrimaryContainer: Color(0xFFEDE7FF),
    secondary: Color(0xFF00BFAE),
    onSecondary: Color(0xFF00332C),
    secondaryContainer: Color(0xFF00332C),
    onSecondaryContainer: Color(0xFFD0F8F6),
    tertiary: Color(0xFFFFB300),
    onTertiary: Color(0xFF4A3200),
    tertiaryContainer: Color(0xFF332100),
    onTertiaryContainer: Color(0xFFFFF3E0),
    error: Color(0xFFFF6659),
    onError: Color(0xFF23233C),
    errorContainer: Color(0xFFB71C1C),
    onErrorContainer: Color(0xFFFFE5E5),
    surface: Color(0xFF181A20), // Deep dark background
    onSurface: Color(0xFFEDE7FF), // Light text
    surfaceContainerHighest: Color(0xFF23233C),
    outline: Color(0xFF44475A),
    shadow: Color(0xFF000000),
    inverseSurface: Color(0xFFEDE7FF),
    onInverseSurface: Color(0xFF23233C),
    inversePrimary: Color(0xFF6C63FF),
  );

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color purpuleColor = Color(0xFF6C63FF);
  static const Color skyblueColor = Color(0xFF00BFAE);
  static const Color greenColor = Color(0xFF43D19E);
  static const Color redColor = Color(0xFFE53935);
  static const Color redColor2 = Color(0xFFD92225);
  static const Color blueDarkColor = Color(0xFF23233C);
}
