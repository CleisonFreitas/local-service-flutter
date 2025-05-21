import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF156778);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFF98600);
  static const Color input = Color(0xFFF0F3F6);
  static const Color inputText = Color(0xFFADB3BC);
  static const Gradient gradient = LinearGradient(
    colors: <Color>[primary, secondary],
  );
}
