import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonTheme {
  static ButtonStyle primary = ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    overlayColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return AppColors.gradientStart;
      }

      return AppColors.primary;
    }),
    backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
    foregroundColor: const WidgetStatePropertyAll(AppColors.primaryForeground),
    textStyle: const WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    ),
    shape: const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );

  static ButtonStyle outline = ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    overlayColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return AppColors.muted;
      }

      return AppColors.background;
    }),
    backgroundColor: const WidgetStatePropertyAll(AppColors.background),
    foregroundColor: const WidgetStatePropertyAll(AppColors.foreground),
    textStyle: const WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    ),
    shape: const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
    ),
  );
}
