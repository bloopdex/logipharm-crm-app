import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';

class EventStatusWidget extends StatelessWidget {
  final String? flag;

  const EventStatusWidget({super.key, required this.flag});

  @override
  Widget build(BuildContext context) {
    Color color;
    String status = '';

    switch (flag) {
      case "EN_ATTENTE":
        color = kBrightSun.shade600;
        status = context.i10n.pending;
        break;
      case "TERMINE":
        color = kSuccessColor;
        status = context.i10n.completed;
        break;
      default:
        color = kCodGray;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPaddingSm3, vertical: kPaddingSm2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(kPaddingSm3),
      ),
      child: Text(
        status,
        style: context.textTheme.bodyMedium!.copyWith(color: color),
      ),
    );
  }
}
