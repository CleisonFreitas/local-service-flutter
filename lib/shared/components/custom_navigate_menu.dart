import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';

class CustomNavigateMenu extends StatelessWidget {
  final IconData icon;
  final bool? hasBadge;
  const CustomNavigateMenu({
    super.key,
    required this.icon,
    this.hasBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon:
          hasBadge == true
              ? Badge(backgroundColor: AppColors.orange, child: Icon(icon))
              : Icon(icon, color: AppColors.inativeText),
      selectedIcon: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          SizedBox(
            height: 60,
            child: Icon(icon, color: AppColors.primary, size: 25),
          ),
          Positioned(top: 50, child: Badge(backgroundColor: AppColors.primary)),
        ],
      ),
      label: '',
    );
  }
}
