import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/components/content_container.dart';
import 'package:local_services/shared/components/custom_button.dart';
import 'package:local_services/shared/components/custom_form_field.dart';
import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class EmailRecoveryScreen extends StatefulWidget {
  const EmailRecoveryScreen({super.key});

  @override
  State<EmailRecoveryScreen> createState() => _EmailRecoveryScreenState();
}

class _EmailRecoveryScreenState extends State<EmailRecoveryScreen> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  late final ValueNotifier<bool> _usePhoneFieldNotifier;

  @override
  void initState() {
    _usePhoneFieldNotifier = ValueNotifier<bool>(false);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _usePhoneFieldNotifier.dispose();
    super.dispose();
  }

  void _changeRecoveryMethod() {
    _usePhoneFieldNotifier.value = !_usePhoneFieldNotifier.value;

    if (_emailController.text.isNotEmpty) {
      _emailController.text = '';
    }

    if (_phoneController.text.isNotEmpty) {
      _phoneController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                CustomTitle(title: 'Forgot password,'),
                CustomSubtitle(
                  title:
                      'Please type your email below and we will give you a OTP code',
                ),
              ],
            ),
            const SizedBox(height: 107),
            ValueListenableBuilder(
              valueListenable: _usePhoneFieldNotifier,
              builder: (context, state, child) {
                return Column(
                  children: <Widget>[
                    CustomFormField(
                      controller: state ? _phoneController : _emailController,
                      label: state ? 'Mobile number' : 'Email address',
                      prefixIcon: state ? Icons.phone : Icons.mail,
                      keyboardType:
                          state
                              ? TextInputType.phone
                              : TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: _changeRecoveryMethod,
                        child: Text(
                          state ? 'Use email address?' : 'Use phone number?',
                          style: AppTexts.subtitle2.primary.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 93),
                    CustomButton(
                      text: 'Send Code',
                      buttonEnum: ButtonEnum.secondary,
                      action: () => context.go('/recovery-otp-email'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
