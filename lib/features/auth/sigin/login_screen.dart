import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/components/card_action.dart';
import 'package:local_services/shared/components/custom_form_field.dart';

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
      body: Container(
        alignment: Alignment.center,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Login', style: AppTexts.headingBold.bold.secondary),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomFormField(
                    controller: _emailController,
                    label: 'Email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    autoFocus: true,
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    controller: _passwordController,
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    isSecret: true,
                  ),
                  const SizedBox(height: 3),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot the password?',
                        style: AppTexts.subtitle1.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: AppColors.secondary),
                        ),
                      ),
                      child: Text('Acessar', style: AppTexts.headingBold.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: Divider(color: AppColors.secondary, thickness: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: AppTexts.subtitle1.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Divider(color: AppColors.secondary, thickness: 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Wrap(
                spacing: 16, // space between items horizontally
                runSpacing: 16, // space between items vertically when wrapped
                alignment: WrapAlignment.center,
                children: <Widget>[
                  CardAction(
                    icon: Icons.g_mobiledata,
                    title: 'Google',
                    function: () {},
                  ),
                  CardAction(
                    icon: Icons.facebook,
                    title: 'Facebook',
                    function: () {},
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
