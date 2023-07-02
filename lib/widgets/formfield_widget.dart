import 'package:flutter/material.dart';

import '../constants/themes.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.controller,
    required this.node,
    this.autofillHints,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.textCaps = TextCapitalization.none,
    this.validator,
    this.prefixIcon,
    required this.hintText,
    this.autovalidateMode,
  });

  final TextEditingController controller;
  final FocusNode node;
  final Iterable<String>? autofillHints;
  final TextInputType keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Function(String)? onChanged;
  final TextCapitalization textCaps;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final String hintText;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: node,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      textCapitalization: textCaps,
      autovalidateMode: autovalidateMode,
      style: AppTextStyle.h4TextStyle(size: 15.0, fontWeight: FontWeight.w500),
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            AppTextStyle.h4TextStyle(color: AppTextTheme.appTextThemeLight),
        counterText: '',
        prefixIcon: prefixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Colors.black26)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: AppTheme.appThemeColor)),
      ),
    );
  }
}
