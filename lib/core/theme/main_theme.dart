import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.secondary,
  fontFamily: 'AncizarSans',
  textTheme: const TextTheme(
    bodyLarge: AppTexts.subtitle1,
    bodyMedium: AppTexts.subtitle2,
    titleLarge: AppTexts.headingBold,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    secondary: AppColors.secondary,
  ),
);
