import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class CircleButtonText extends StatelessWidget {
  final IconData icon;
  final String? text;

  final Color? color;
  final void Function()? onPressed;

  const CircleButtonText(
      {super.key, required this.icon, this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: context.elevatedButtonTheme.copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kRadiusRounded),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              color ?? kPrimaryColor,
            ),
          ),
          onPressed: onPressed,
          child: Icon(
            icon,
            size: 26.sp,
            color: kWhite,
          ),
        ),
        if (text != null)
          Column(
            children: [
              SizedBox(height: kSpacingX2),
              Text(
                text!,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 3,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
      ],
    );
  }
}
