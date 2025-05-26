import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/components/custom_button.dart';
import 'package:local_services/shared/components/custom_snackbar.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/before_login_screen.jpg',
            fit: BoxFit.cover,
          ),
          Container(color: const Color.fromRGBO(0, 0, 0, 0.5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Let's Join with Us!",
                    style: AppTexts.headingBold.white,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 400,
                    child: Text(
                      'Find the service you want or offer something you like to do!',
                      textAlign: TextAlign.center,
                      style: AppTexts.subtitle1.white.copyWith(fontSize: 22),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Join with Google',
                    buttonEnum: ButtonEnum.primary,
                    icon: Icons.search,
                    action:
                        () => CustomSnackBar.showInfo(
                          context,
                          'Em desenvolvimento',
                        ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Join with Email',
                    buttonEnum: ButtonEnum.secondary,
                    icon: Icons.email,
                    action:
                        () => CustomSnackBar.showInfo(
                          context,
                          'Em desenvolvimento',
                        ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account?',
                        style: AppTexts.subtitle1.white.copyWith(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () => context.go('/auth/sign-in/login'),
                        child: Text(
                          'Sign In',
                          style: AppTexts.subtitle1.copyWith(
                            color: AppColors.orange,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
