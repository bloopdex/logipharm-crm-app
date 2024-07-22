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
    this.minLines = 1,
    this.autoFillHints = const [],
    this.onChanged,
    this.controller,
    this.focusNode,
    this.readOnly = false,
  });

  final FocusNode? focusNode;
  final String? initialValue;
  final String? hintText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final Map<String, dynamic>? data;
  final String? mapKey;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final int maxLines;
  final int minLines;
  final List<String> autoFillHints;
  final String? Function(String?)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      focusNode: focusNode,
      controller: controller,
      initialValue: initialValue,
      autocorrect: false,
      validator: validator,
      onChanged: onChanged,
      onSaved: (newValue) => data![mapKey!] = newValue!.toString(),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
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
