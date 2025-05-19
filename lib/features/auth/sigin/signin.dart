import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/components/custom_form_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          ],
        ),
      ),
    );
  }
}
