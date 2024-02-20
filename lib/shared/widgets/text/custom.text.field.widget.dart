import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.onChange,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
  });

  final String? initialValue;
  final String? hintText;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autocorrect: false,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: textSecondary,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: textSecondary,
        ),
      ),
    );
  }
}
