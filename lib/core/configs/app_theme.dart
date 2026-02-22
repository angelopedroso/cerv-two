import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeData = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.input,
      hintStyle: const TextStyle(
        color: AppColors.mutedForeground,
        fontWeight: FontWeight.bold,
      ),
      contentPadding: const EdgeInsets.all(6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.ring, width: 1.5),
      ),
    ),

    cardTheme: const CardThemeData(
      color: AppColors.card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.zero,
      ),
      margin: EdgeInsets.all(0),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryForeground,
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.foreground,
    ),

    snackBarTheme: SnackBarThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.background,
      contentTextStyle: const TextStyle(color: AppColors.foreground),
    ),

    popupMenuTheme: PopupMenuThemeData(
      elevation: 1,
      color: AppColors.background,
      iconColor: AppColors.foreground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      position: PopupMenuPosition.under,
      menuPadding: const EdgeInsets.all(6),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),

      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),

      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),

      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),

      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}
