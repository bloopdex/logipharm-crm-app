import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/const.dart';
import '../../../core/extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor = kCeruleanBlue,
    this.textColor = Colors.white,
    this.height,
    this.icon,
    this.disabled = false,
  });

  final String? text;
  final IconData? icon;
  final Color textColor;
  final double? height;
  final void Function()? onPressed;
  final Color backgroundColor;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? () {} : onPressed,
      style: context.elevatedButtonTheme.copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, height ?? 50.sp),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: textColor,
                  size: 20.sp,
                ),
                SizedBox(width: kSpacingX1)
              ],
            ),
          if (text != null)
            Text(text!,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium!.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
