import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  final String label;
  final VoidCallback? function;
  final bool? isSecret;
  final bool? autoFocus;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.function,
    this.isSecret = false,
    this.autoFocus = false,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _isHidden;
  late IconData _suffixIconPassword;

  @override
  void initState() {
    if (mounted) {
      _isHidden = widget.isSecret == true;
      _suffixIconPassword = Icons.visibility;
    }
    super.initState();
  }

  void _changeVisibility() {
    if (mounted) {
      _isHidden = !_isHidden;
      _suffixIconPassword = _isHidden ? Icons.visibility : Icons.visibility_off;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofocus: widget.autoFocus == true,
      style: const TextStyle(
        height: 2,
        fontSize: 18,
        color: AppColors.secondary,
      ),
      obscureText: _isHidden,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(color: AppColors.secondary),
        prefixIcon:
            widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: AppColors.secondary)
                : null,
        suffixIcon:
            widget.suffixIcon != null || widget.isSecret == true
                ? IconButton(
                  onPressed: widget.function ?? _changeVisibility,
                  icon: Icon(widget.suffixIcon ?? _suffixIconPassword),
                  color: AppColors.secondary,
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
      ),
    );
  }
}
