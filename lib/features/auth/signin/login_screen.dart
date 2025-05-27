import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/features/auth/signin/bloc/events/login_form_event.dart';
import 'package:local_services/features/auth/signin/bloc/logic/login_form_bloc.dart';
import 'package:local_services/features/auth/signin/bloc/state/login_form_state.dart';
import 'package:local_services/features/auth/signin/validations/login_validations.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _sendForm() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginFormBloc>().add(
        SubmitLoginFormEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
      context.go('/booking/customer-booking');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTitle(title: 'Welcome back,'),
                CustomSubtitle(
                  title:
                      'Glad to meet you again!, please login to use the app.',
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: <Widget>[
                  CustomFormField(
                    controller: _emailController,
                    label: 'Email',
                    prefixIcon: Icons.mail,
                    validator: (value) {
                      final result = validateLoginEmailField(value ?? '');
                      return result['firstError'];
                    },
                  ),
                  CustomFormField(
                    controller: _passwordController,
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    isSecret: true,
                    validator: (value) {
                      final result = validateLoginPasswordField(value ?? '');
                      return result['firstError'];
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed:
                          () => context.go(
                            '/auth/password-recovery/recovery-password-email',
                          ),
                      child: Text(
                        'Forgot password?',
                        style: AppTexts.subtitle1.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<LoginFormBloc, BaseState>(
                  builder: (context, state) {
                    return CustomButton(
                      text: "Sign In",
                      buttonEnum: ButtonEnum.secondary,
                      action: _sendForm,
                      isLoading: state is LoginFormLoading,
                    );
                  },
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
                      Text("Don't have an account?", style: AppTexts.subtitle1),
                      InkWell(
                        child: RichText(
                          text: TextSpan(
                            text: 'Join Now',
                            style: AppTexts.subtitle1.primary.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap:
                            () => GoRouter.of(
                              context,
                            ).go('/auth/sign-up/register'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
