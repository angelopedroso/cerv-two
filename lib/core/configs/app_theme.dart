import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: const TextStyle(
        color: AppColors.mutedForeground,
        fontWeight: FontWeight.bold,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.input, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.destructive, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.destructive, width: 1.5),
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
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        overlayColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.gradientStart;
          }

          return AppColors.primary;
        }),
        backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
        foregroundColor: const WidgetStatePropertyAll(
          AppColors.primaryForeground,
        ),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
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
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.mutedForeground,
      ),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}
