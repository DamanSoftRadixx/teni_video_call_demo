import 'package:flutter/material.dart';
import 'color_schemes.dart' show AppColorSchemes;
import 'text_styles.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColorSchemes.lightColorScheme,
    textTheme: AppTextStyles.textTheme,
    scaffoldBackgroundColor: AppColorSchemes.lightColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorSchemes.lightColorScheme.surface,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColorSchemes.lightColorScheme.primary),
      titleTextStyle: AppTextStyles.textTheme.titleLarge?.copyWith(
        color: AppColorSchemes.lightColorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorSchemes.lightColorScheme.primary,
        foregroundColor: AppColorSchemes.lightColorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        textStyle: AppTextStyles.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorSchemes.whiteColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextStyles.textTheme.bodyLarge?.copyWith(
        color: AppColorSchemes.lightColorScheme.onSurface.withOpacity(0.5),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColorSchemes.darkColorScheme,
    textTheme: AppTextStyles.textTheme,
    scaffoldBackgroundColor: AppColorSchemes.darkColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorSchemes.darkColorScheme.surface,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColorSchemes.darkColorScheme.primary),
      titleTextStyle: AppTextStyles.textTheme.titleLarge?.copyWith(
        color: AppColorSchemes.darkColorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorSchemes.darkColorScheme.primary,
        foregroundColor: AppColorSchemes.darkColorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        textStyle: AppTextStyles.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorSchemes.blueDarkColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextStyles.textTheme.bodyLarge?.copyWith(
        color: AppColorSchemes.darkColorScheme.onSurface.withOpacity(0.5),
      ),
    ),
  );

  /// Get ThemeData by brightness
  static ThemeData getThemeByBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }

  /// Optionally, get the current color scheme from context
  static ColorScheme colorSchemeOf(BuildContext context) =>
      Theme.of(context).colorScheme;

  /// Optionally, get the current text theme from context
  static TextTheme textThemeOf(BuildContext context) =>
      Theme.of(context).textTheme;
}
