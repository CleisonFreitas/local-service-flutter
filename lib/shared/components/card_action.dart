import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';

class CardAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback function;
  const CardAction({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth =
            constraints.maxWidth * 0.4; // 40% of available width
        final double cardHeight = cardWidth * 1.1; // Maintain aspect ratio

        return SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Card(
            elevation: 10,
            surfaceTintColor: AppColors.secondary,
            color: AppColors.input,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: AppColors.secondary,
                    size: cardWidth * 0.33,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTexts.subtitle2.copyWith(
                      color: AppColors.secondary,
                      fontSize: cardWidth * 0.12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
