import 'package:flutter/material.dart';

class CustomDropDownInput extends StatelessWidget {
  final List<CustomDropDownItem> items;
  final Map<String, dynamic> data;
  final String mapKey;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;
  const CustomDropDownInput({
    super.key,
    required this.items,
    required this.data,
    required this.mapKey,
    this.onChanged,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: initialValue != null && initialValue!.isNotEmpty
          ? initialValue
          : items.isNotEmpty
              ? items.first.value
              : null,
      items: List.generate(items.length, (index) {
        return DropdownMenuItem(
          value: items[index].value,
          child: Text(
            items[index].label,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      }),
      onChanged: onChanged ?? (value) => data[mapKey] = value,
      validator: validator,
    );
  }
}

class CustomDropDownItem {
  final String label;
  final String value;

  CustomDropDownItem({required this.label, required this.value});
}
