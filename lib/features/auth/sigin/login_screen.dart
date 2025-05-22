import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/components/content_container.dart';
import 'package:local_services/shared/components/custom_button.dart';
import 'package:local_services/shared/components/custom_form_field.dart';
import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTitle(title: 'Welcome back,'),
                  CustomSubtitle(
                    title:
                        'Glad to meet you again!, please login to use the app.',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 10,
                children: <Widget>[
                  CustomFormField(
                    controller: _emailController,
                    label: 'Email',
                    prefixIcon: Icons.mail,
                  ),
                  CustomFormField(
                    controller: _passwordController,
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    isSecret: true,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => print('Clicou em esqueceu a senha'),
                      child: Text(
                        'Forgot password?',
                        style: AppTexts.subtitle1.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    text: "Sign In",
                    buttonEnum: ButtonEnum.secondary,
                    action: () {},
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            child: Divider(
                              color: AppColors.primary,
                              thickness: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'OR',
                            style: AppTexts.subtitle1.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Divider(
                              color: AppColors.primary,
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: "Sign In with Google",
                    buttonEnum: ButtonEnum.primary,
                    action: () {},
                    icon: Icons.account_circle_sharp,
                  ),
                  const SizedBox(height: 22),
                  Align(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 2,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: AppTexts.subtitle1,
                        ),
                        InkWell(
                          child: RichText(
                            text: TextSpan(
                              text: 'Join Now',
                              style: AppTexts.subtitle1.primary.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () => GoRouter.of(context).go('/register'),
                        ),
                      ],
                    ),
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
