import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';

class AppTexts {
  const AppTexts._();

  static const TextStyle headingBold = TextStyle(
    fontFamily: 'AncizarSans',
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontFamily: 'AncizarSans',
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontFamily: 'AncizarSans',
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static const TextStyle captionItalic = TextStyle(
    fontFamily: 'AncizarSans',
    fontStyle: FontStyle.italic,
    fontSize: 12,
  );
}

extension TextStyleX on TextStyle {
  TextStyle get white => copyWith(color: AppColors.secondary);
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get secondary => copyWith(color: AppColors.secondary);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
