import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';

class CustomDropDownInput extends StatelessWidget {
  final List<CustomDropDownItem> items;
  final Map<String, dynamic> data;
  final String mapKey;
  final String hint;
  final ValueChanged<String?>? onChanged;
  const CustomDropDownInput({
    super.key,
    required this.items,
    required this.data,
    required this.mapKey,
    this.hint = "",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: hint.isNotEmpty
          ? null
          : items.isNotEmpty
              ? items.first.value
              : null,
      hint: Text(hint, style: context.textTheme.bodySmall),
      items: List.generate(items.length, (index) {
        return DropdownMenuItem(
          value: items[index].value,
          child: Text(
            items[index].label,
          ),
        );
      }),
      onChanged: onChanged ?? (value) => data[mapKey] = value,
    );
  }
}

class CustomDropDownItem {
  final String label;
  final String value;

  CustomDropDownItem({required this.label, required this.value});
}
