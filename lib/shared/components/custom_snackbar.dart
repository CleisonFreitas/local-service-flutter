import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    _show(context, message, const Color.fromARGB(255, 21, 120, 54));
  }

  static void showInfo(BuildContext context, String message) {
    _show(context, message, AppColors.orange);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message, AppColors.error);
  }

  static void _show(BuildContext context, String message, Color color) {
    final snackbar = SnackBar(
      content: Text(message, style: AppTexts.subtitle1.secondary),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
