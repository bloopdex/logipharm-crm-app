// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';

class CustomDateTimePicker extends StatefulWidget {
  final Map<String, dynamic> data;
  final String mapKey;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData? icon;
  final String dateFormat;
  final Function(String)? onChanged;

  final DateTime? initialDate;

  const CustomDateTimePicker({
    super.key,
    required this.data,
    required this.mapKey,
    this.firstDate,
    this.lastDate,
    this.icon,
    this.dateFormat = 'yyyy-MM-dd HH:mm',
    this.initialDate,
    this.onChanged,
  });

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    DateTime defaultDate = widget.initialDate ?? DateTime.now();
    controller.text = DateFormat(widget.dateFormat).format(defaultDate);
    widget.data[widget.mapKey] = defaultDate.toIso8601String();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: context.i10n.selectDateTime, // Assuming this is a localization key
        suffixIcon: Icon(widget.icon ?? Icons.access_time),
      ),
      style: TextStyle(fontSize: 14.0),
      onTap: () async {
        // Show Cupertino date and time picker
        await showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.white,
              height: context.height * 0.4,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: widget.initialDate ?? DateTime.now(),
                minimumDate: widget.firstDate ?? DateTime(DateTime.now().year, 1, 1),
                maximumDate: widget.lastDate ?? DateTime(DateTime.now().year, 12, 31),
                onDateTimeChanged: (DateTime value) {
                  // Update text field with display format
                  String displayFormatted = DateFormat(widget.dateFormat).format(value);

                  // Save in ISO format to data and call onChanged
                  String isoFormatted = value.toIso8601String();

                  setState(() {
                    controller.text = displayFormatted;
                    widget.data[widget.mapKey] = isoFormatted;
                  });

                  widget.onChanged?.call(isoFormatted);
                },
              ),
            );
          },
        );
      },
    );
  }
}
