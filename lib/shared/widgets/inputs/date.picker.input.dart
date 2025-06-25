// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';

class CustomDatePicker extends StatefulWidget {
  final Map<String, dynamic> data;
  final String mapKey;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData? icon;
  final String dateFormat;
  final Function(String)? onChanged;

  final DateTime? initialDate;
  const CustomDatePicker({
    super.key,
    required this.data,
    required this.mapKey,
    this.firstDate,
    this.lastDate,
    this.icon,
    this.dateFormat = 'yyyy-MM-dd',
    this.initialDate,
    this.onChanged,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    final defaultDate = widget.initialDate ?? widget.firstDate ?? DateTime.now();
    controller.text = DateFormat(widget.dateFormat).format(defaultDate);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: context.i10n.selectDate,
        suffixIcon: Icon(widget.icon ?? Icons.calendar_today),
      ),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: widget.firstDate ?? DateTime.now(),
          firstDate: widget.firstDate ?? DateTime(DateTime.now().year, 1, 1),
          lastDate: widget.lastDate ?? DateTime(DateTime.now().year, 12, 31),
          helpText: context.i10n.selectDate,
          confirmText: context.i10n.confirm,
          cancelText: context.i10n.cancel,
          initialEntryMode: DatePickerEntryMode.calendar,
          fieldHintText: context.i10n.selectDate,
          fieldLabelText: context.i10n.selectDate,
          builder: (context, child) {
            return Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: context.height * 0.8,
                width: context.width * 0.9,
                child: child,
              ),
            );
          },
        );
        if (picked != null) {
          setState(() {
            String formatted = DateFormat(widget.dateFormat).format(picked);
            if (DateTime.now().difference(picked).inDays == 0) {
              controller.text = context.i10n.today;
            } else {
              controller.text = formatted;
            }
            widget.data[widget.mapKey] = formatted;
          });

          widget.onChanged?.call(controller.text);
        }
      },
    );
  }
}
