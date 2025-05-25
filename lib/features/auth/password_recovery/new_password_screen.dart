import 'package:flutter/material.dart';
import 'package:local_services/shared/components/content_container.dart';
import 'package:local_services/shared/components/custom_button.dart';
import 'package:local_services/shared/components/custom_form_field.dart';
import 'package:local_services/shared/components/custom_snackbar.dart';
import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late ValueNotifier<bool> _isLoadingNotifier;
  final _formKey = GlobalKey<FormState>();
  final List<String?> _fieldsError = [];

  @override
  void initState() {
    _isLoadingNotifier = ValueNotifier<bool>(false);
    super.initState();
  }

  Future<void> _sendingForm() async {
    _isLoadingNotifier.value = true;

    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;

      if (!_formKey.currentState!.validate()) {
        _isLoadingNotifier.value = false;
        final errorMessage =
            _fieldsError.length > 1
                ? "${_fieldsError.length} errors has been found. Please, verify the informations"
                : "${_fieldsError[0]}";
        CustomSnackBar.showError(context, errorMessage);
        throw Exception(errorMessage);
      }

      CustomSnackBar.showSuccess(context, 'Password updated with successful');
      _isLoadingNotifier.value = false;
    });
  }

  String? _validatePasswordField(String value) {
    final validations = [
      [value.isEmpty, 'The password field is required'],
      [value.length < 8, 'The new password must have at least 8 characters'],
    ];

    for (dynamic validation in validations) {
      final condition = validation[0] as bool;
      final errorMessage = validation[1] as String;

      if (_fieldsError.contains(errorMessage)) {
        _fieldsError.remove(errorMessage);
      }

      if (condition) {
        _fieldsError.add(errorMessage);
        return errorMessage;
      }
    }
    return null; // All validations passed
  }

  String? _validateConfirmPasswordField(String value) {
    final String password = _passwordController.text;

    final validations = [
      [value.isEmpty, 'The confirm password field is required'],
      [
        value != password,
        'The confirm password field must be equals to password',
      ],
    ];

    for (dynamic validation in validations) {
      final condition = validation[0] as bool;
      final errorMessage = validation[1] as String;

      if (_fieldsError.contains(errorMessage)) {
        _fieldsError.remove(errorMessage);
      }

      if (condition) {
        _fieldsError.add(errorMessage);
        return errorMessage;
      }
    }

    return null; // All validations passed
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTitle(title: 'New password,'),
              CustomSubtitle(
                title: 'Now, you can create new password and confirm it below',
              ),
              const SizedBox(height: 102),
              Wrap(
                spacing: 10,
                children: [
                  CustomFormField(
                    controller: _passwordController,
                    label: 'New password',
                    isSecret: true,
                    prefixIcon: Icons.lock,
                    //  autoFocus: true,
                    validator:
                        (value) =>
                            value != null
                                ? _validatePasswordField(value)
                                : null,
                  ),
                  CustomFormField(
                    controller: _confirmPasswordController,
                    label: 'Confirm new password',
                    isSecret: true,
                    prefixIcon: Icons.lock,
                    validator:
                        (value) =>
                            value != null
                                ? _validateConfirmPasswordField(value)
                                : null,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ValueListenableBuilder(
                valueListenable: _isLoadingNotifier,
                builder: (context, state, child) {
                  return CustomButton(
                    text: 'Confirm new password',
                    buttonEnum: ButtonEnum.secondary,
                    action: _sendingForm,
                    isLoading: state,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
