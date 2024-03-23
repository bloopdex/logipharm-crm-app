import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class CircleButtonText extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onPressed;
  const CircleButtonText(
      {super.key, required this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: context.elevatedButtonTheme.copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kRadiusRounded),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Icon(
            icon,
            size: 26.sp,
            color: kWhite,
          ),
        ),
        SizedBox(height: kSpacingX2),
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
