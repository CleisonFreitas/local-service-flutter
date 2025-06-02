import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/shared/components/custom_professional_card.dart';

class CardWorker extends StatelessWidget {
  final String image;
  final int id;
  const CardWorker({super.key, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CustomProfessionalCard.showModal(context, id),
      child: Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover, // this fills the circle
          ),
        ),
      ),
    );
  }
}
