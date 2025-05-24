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
  final double? borderRadius;
  final int? maxLength;
  final bool? isOneDigit;
  final FocusNode? focusNode;

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
    this.borderRadius = 50,
    this.maxLength = 255,
    this.isOneDigit = false,
    this.focusNode,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _isHidden;
  late IconData _suffixIconPassword;
  late bool _hasFocus;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _isHidden = widget.isSecret == true;
    _suffixIconPassword = Icons.visibility;

    final node = widget.focusNode ?? FocusNode();
    _focusNode = node;
    _hasFocus = node.hasFocus;

    node.addListener(() {
      setState(() {
        _hasFocus = node.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _changeVisibility() {
    setState(() {
      _isHidden = !_isHidden;
      _suffixIconPassword = _isHidden ? Icons.visibility : Icons.visibility_off;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive = _hasFocus;

    return SizedBox(
      height: 54,
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        maxLength: widget.maxLength!,
        autofocus: widget.autoFocus == true,
        obscureText: _isHidden,
        keyboardType: widget.keyboardType,
        textAlign:
            widget.isOneDigit == true ? TextAlign.center : TextAlign.start,
        style: AppTexts.subtitle1.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: widget.isOneDigit == true ? 22 : 14,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          counterText: "",
          hintText: widget.label,
          hintStyle: AppTexts.subtitle1.copyWith(color: AppColors.inputText),
          filled: true,
          fillColor: isActive ? AppColors.secondary : AppColors.input,
          prefixIcon:
              widget.prefixIcon != null
                  ? Icon(
                    widget.prefixIcon,
                    color: AppColors.inputText,
                    size: 18,
                  )
                  : null,
          suffixIcon:
              (widget.suffixIcon != null || widget.isSecret == true)
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
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            borderSide: const BorderSide(color: AppColors.secondary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            borderSide: BorderSide(
              color: isActive ? AppColors.primary : AppColors.secondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
