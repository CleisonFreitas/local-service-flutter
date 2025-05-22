import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';

class ContentContainer extends StatelessWidget {
  final Widget child;
  const ContentContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(color: AppColors.secondary),
      child: child,
    );
  }
}
