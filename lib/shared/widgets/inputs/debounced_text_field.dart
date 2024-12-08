import 'dart:async';

import 'package:flutter/material.dart';

class DebouncedTextField extends StatefulWidget {
  final Function(String) onChanged;
  final String hintText;

  const DebouncedTextField({
    super.key,
    required this.onChanged,
    required this.hintText,
  });

  @override
  DebouncedTextFieldState createState() => DebouncedTextFieldState();
}

class DebouncedTextFieldState extends State<DebouncedTextField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onValueChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onValueChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
    );
  }
}
