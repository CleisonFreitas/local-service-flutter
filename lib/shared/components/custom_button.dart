import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonEnum buttonEnum;
  final VoidCallback? action;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    this.action,
    this.icon,
    required this.buttonEnum,
  });

  @override
  Widget build(BuildContext context) {
    final Map<ButtonEnum, Map<String, Color>> listColorOption = {
      ButtonEnum.primary: {
        'text': AppColors.primary,
        'background': AppColors.secondary,
      },
      ButtonEnum.secondary: {
        'text': AppColors.secondary,
        'background': AppColors.primary,
      },
    };
    final Map<String, Color>? colors = listColorOption[buttonEnum];
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors!['background'],
        foregroundColor: colors['text'],
        surfaceTintColor: Colors.transparent, // This fixes the glassy effect
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: action,
      child: Align(
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            if (icon != null) ...[Icon(icon, color: colors['text'], size: 17)],
            Text(
              text,
              style: AppTexts.headingBold.copyWith(color: colors['text']),
            ),
          ],
        ),
      ),
    );
  }
}
