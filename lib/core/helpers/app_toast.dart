import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class AppToast {
  static void error(
    BuildContext context, {
    String? title,
    required String message,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    final toast = SnackBar(
      width: screenWidth * 0.4,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title,
              style: const TextStyle(
                color: AppColors.foreground,
                fontWeight: FontWeight.bold,
              ),
            ),
          Text(message),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(toast);
  }
}
