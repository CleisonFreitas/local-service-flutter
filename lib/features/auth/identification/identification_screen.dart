import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/components/custom_button.dart';
import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        leading: IconButton(
          onPressed: () => GoRouter.of(context).go('/register'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(color: AppColors.secondary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitle(title: 'Perfil de usuário'),
                  CustomSubtitle(
                    title:
                        'Escolha um perfil que se adeque ao que você está procurando',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: <Widget>[
                  CustomButton(
                    text: 'Desejo contratar serviços',
                    buttonEnum: ButtonEnum.secondary,
                    action: () {},
                  ),
                  Text(
                    'Ou',
                    style: AppTexts.subtitle2.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomButton(
                    text: 'Desejo oferecer serviços',
                    buttonEnum: ButtonEnum.primary,
                    action: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
