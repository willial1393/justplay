import 'package:flutter/material.dart';
import 'package:justplay/app/theme/jp_colors.dart';

class JpTextInput extends StatelessWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  const JpTextInput({
    required this.label,
    super.key,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: JpColors.black,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label),
        errorMaxLines: 3,
      ),
    );
  }
}
