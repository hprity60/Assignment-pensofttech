// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Color? color;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final Color? fillColor;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.borderRadius,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.obscureText,
    this.color,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode,
      validator: validator,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: borderColor,
        filled: true,
        errorStyle: const TextStyle(height: 0),
        hintText: hintText,
        contentPadding: const EdgeInsets.all(15),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
        ),
      ),
    );
  }
}
