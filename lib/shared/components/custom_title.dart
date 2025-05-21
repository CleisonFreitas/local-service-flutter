import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_texts.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTexts.headingBold);
  }
}
