import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications_none_rounded),
      color: kBgBlack,
      onPressed: () {},
    );
  }
}
