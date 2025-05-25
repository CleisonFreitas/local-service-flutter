import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';

class ContentContainer extends StatelessWidget {
  final Widget child;
  const ContentContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        width: screenSize.width,
        height: screenSize.height,
        padding: EdgeInsets.only(left: 16, right: 22, top: 35, bottom: 10),
        decoration: BoxDecoration(color: AppColors.secondary),
        child: child,
      ),
    );
  }
}
