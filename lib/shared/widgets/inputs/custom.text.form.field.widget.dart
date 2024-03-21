import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.data,
    this.validator,
    this.mapKey,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.autoFillHints = const [],
  });

  final String? initialValue;
  final String? hintText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final Map<String, dynamic>? data;
  final String? Function(String?)? validator;
  final String? mapKey;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final int maxLines;
  final List<String> autoFillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autocorrect: false,
      validator: validator,
      onSaved: (newValue) => data![mapKey!] = newValue!.toString(),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      autofillHints: autoFillHints,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
              )
            : null,
      ),
    );
  }
}
