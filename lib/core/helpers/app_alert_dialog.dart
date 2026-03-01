import 'package:cerv_two/core/configs/app_button_theme.dart';
import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class AppAlertDialog {
  static void alert({
    required BuildContext context,
    required String title,
    required VoidCallback onConfirm,
    String description = "",
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.border, width: 1),
          ),
          backgroundColor: AppColors.background,
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.mutedForeground,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 24.0,
          ),
          actions: [
            ElevatedButton(
              style: AppButtonTheme.outline,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                onConfirm();

                Navigator.of(context).pop();
              },
              child: const Text("Continuar"),
            ),
          ],
        );
      },
    );
  }
}
