import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/helpers/convert_integer_into_time.dart';
import 'package:local_services/shared/components/content_container.dart';
import 'package:local_services/shared/components/custom_button.dart';
import 'package:local_services/shared/components/custom_form_field.dart';
import 'package:local_services/shared/components/custom_snackbar.dart';
import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class EmailOtpScreen extends StatefulWidget {
  const EmailOtpScreen({super.key});

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  final _firstDigitController = TextEditingController();
  final _secondDigitController = TextEditingController();
  final _thirdDigitController = TextEditingController();
  final _fourthDigitController = TextEditingController();
  late ValueNotifier<int> _timeResendingNotifier;
  late ValueNotifier<bool> _isLoadingNotifier;

  @override
  void initState() {
    _timeResendingNotifier = ValueNotifier<int>(170); // quantidade de segundos
    _isLoadingNotifier = ValueNotifier<bool>(false);
    _runSchedule();
    super.initState();
  }

  void _runSchedule() {
    Timer.periodic(Duration(seconds: 1), (Timer time) {
      if (!mounted) return;

      if (_timeResendingNotifier.value > 0) {
        _timeResendingNotifier.value--;
      }
    });
  }

  void _resendCode() {
    _timeResendingNotifier.value = 170;
    CustomSnackBar.showSuccess(context, 'Code resent');
  }

  Future<void> _verifyEmail() async {
    _isLoadingNotifier.value = true;
    await Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        _isLoadingNotifier.value = false;
        CustomSnackBar.showSuccess(context, 'Code verified with success');

        Future.delayed(Duration(seconds: 2), () {
          if (!mounted) return;
          context.go('/recovery-new-password');
        });
      }
    });
  }

  @override
  void dispose() {
    _firstDigitController.dispose();
    _secondDigitController.dispose();
    _thirdDigitController.dispose();
    _fourthDigitController.dispose();
    _timeResendingNotifier.dispose();
    _isLoadingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidgetMediaQuery = MediaQuery.of(context).size.width;
    // 4 é a quantidade de inputs e 12 do  padding do container + 10 spacing.
    final otpFieldWidth = screenWidgetMediaQuery / 4 - 28;

    return Scaffold(
      body: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTitle(title: 'Email verification,'),
            CustomSubtitle(title: 'Please type OTP code that we give you'),
            const SizedBox(height: 102),
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              spacing: 10,
              children: <Widget>[
                SizedBox(
                  width: otpFieldWidth,
                  child: CustomFormField(
                    controller: _firstDigitController,
                    label: '',
                    borderRadius: 10,
                    maxLength: 1,
                    isOneDigit: true,
                    autoFocus: true,
                  ),
                ),
                SizedBox(
                  width: otpFieldWidth,
                  child: CustomFormField(
                    controller: _secondDigitController,
                    label: '',
                    borderRadius: 10,
                    maxLength: 1,
                    isOneDigit: true,
                  ),
                ),
                SizedBox(
                  width: otpFieldWidth,
                  child: CustomFormField(
                    controller: _thirdDigitController,
                    label: '',
                    borderRadius: 10,
                    maxLength: 1,
                    isOneDigit: true,
                  ),
                ),
                SizedBox(
                  width: otpFieldWidth,
                  child: CustomFormField(
                    controller: _fourthDigitController,
                    label: '',
                    borderRadius: 10,
                    maxLength: 1,
                    isOneDigit: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: _timeResendingNotifier,
              builder: (context, state, child) {
                return Align(
                  alignment: Alignment.topRight,
                  child:
                      state > 0
                          ? Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 4,
                            children: [
                              Text(
                                'Resend on',
                                style: AppTexts.subtitle1.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.inativeText,
                                ),
                              ),
                              Text(
                                ConvertIntegerIntoTime.formatToMinutesAndSeconds(
                                  state,
                                ),
                                style: AppTexts.subtitle1.primary.bold.copyWith(
                                  fontSize: 16,
                                  color: AppColors.inativeText,
                                ),
                              ),
                            ],
                          )
                          : InkWell(
                            child: Text(
                              'Resend',
                              style: AppTexts.subtitle1.primary.bold,
                            ),
                            onTap: () => _resendCode(),
                          ),
                );
              },
            ),
            const SizedBox(height: 98),
            ValueListenableBuilder(
              valueListenable: _isLoadingNotifier,
              builder: (context, state, child) {
                return CustomButton(
                  text: 'Verify Email',
                  buttonEnum: ButtonEnum.secondary,
                  action: _verifyEmail,
                  isLoading: state,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
