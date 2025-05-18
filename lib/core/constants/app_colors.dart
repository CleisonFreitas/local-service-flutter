import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF7464a7);
  static const Color secondary = Color(0xFFebe3f0);
  static const Gradient gradient = LinearGradient(
    colors: <Color>[primary, secondary],
  );
}
