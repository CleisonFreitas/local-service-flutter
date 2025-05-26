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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTitle(title: 'Create an account'),
            CustomSubtitle(
              title:
                  'Please type full information bellow and we can create your account',
            ),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 2,
              children: <Widget>[
                CustomFormField(
                  controller: _nameController,
                  label: 'Name',
                  prefixIcon: Icons.person,
                ),
                CustomFormField(
                  controller: _emailController,
                  label: 'Email address',
                  prefixIcon: Icons.mail,
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomFormField(
                  controller: _phoneController,
                  label: 'Mobile number',
                  prefixIcon: Icons.mobile_friendly_rounded,
                  keyboardType: TextInputType.phone,
                ),
                CustomFormField(
                  controller: _passwordController,
                  label: 'Password',
                  prefixIcon: Icons.lock,
                  isSecret: true,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 2,
                  children: <Widget>[
                    Text(
                      'By signing up you agree to our',
                      style: AppTexts.subtitle1,
                    ),
                    InkWell(
                      child: Text(
                        'Term of use and privacy',
                        style: AppTexts.subtitle1.primary,
                      ),
                      onTap: () => print('Acessando termos de serviço'),
                    ),
                    Text('notice', style: AppTexts.subtitle1),
                  ],
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: "Join now",
                  buttonEnum: ButtonEnum.secondary,
                  action: () => context.go('/identification'),
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
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Join with Google",
              buttonEnum: ButtonEnum.primary,
              action: () => context.go('/identification'),
              icon: Icons.account_circle_sharp,
            ),
            const SizedBox(height: 22),
            Align(
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: <Widget>[
                  Text('Already have an account?', style: AppTexts.subtitle1),
                  InkWell(
                    child: RichText(
                      text: TextSpan(
                        text: 'Sign In',
                        style: AppTexts.subtitle1.primary,
                      ),
                    ),
                    onTap: () => GoRouter.of(context).go('/auth/sign-in/login'),
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
