import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/core/constants/app_texts.dart';

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
  late bool _isHover;

  @override
  void initState() {
    if (mounted) {
      _isHidden = widget.isSecret == true;
      _suffixIconPassword = Icons.visibility;
      _isHover = false;
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
    return SizedBox(
      height: 54,
      child: MouseRegion(
        cursor: MouseCursor.defer,
        onEnter: (_) => setState(() => _isHover = true),
        onExit: (_) => setState(() => _isHover = false),
        child: TextField(
          maxLength: 255,
          controller: widget.controller,
          autofocus: widget.autoFocus == true,
          style: AppTexts.subtitle1.copyWith(fontWeight: FontWeight.bold),
          obscureText: _isHidden,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            counterText: "",
            hintText: widget.label,
            hintStyle: AppTexts.subtitle1.copyWith(color: AppColors.inputText),
            filled: !_isHover,
            fillColor: AppColors.input,
            focusColor: AppColors.secondary,
            hoverColor: AppColors.secondary,
            prefixIcon:
                widget.prefixIcon != null
                    ? Icon(
                      widget.prefixIcon,
                      color: AppColors.inputText,
                      size: 18,
                    )
                    : null,
            suffixIcon:
                widget.suffixIcon != null || widget.isSecret == true
                    ? IconButton(
                      onPressed: widget.function ?? _changeVisibility,
                      icon: Icon(
                        widget.suffixIcon ?? _suffixIconPassword,
                        size: 18,
                      ),
                      color: AppColors.inputText,
                    )
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.secondary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: _isHover ? AppColors.primary : AppColors.secondary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: _isHover ? AppColors.primary : AppColors.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
