import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final double? size;
  final String? image;
  final String text;
  final TextStyle? textStyle;

  const ProfileCard({
    super.key,
    this.size,
    this.image,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.sp ?? 50.sp,
      height: size?.sp ?? 50.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kBgGrayVisibility1,
        shape: BoxShape.circle,
        border: Border.all(
          color: kBorder3,
          width: 1,
        ),
      ),
      child: image != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(kRadiusRounded),
              child: Image.network(
                image!,
                width: size?.sp ?? 50.sp,
                height: size?.sp ?? 50.sp,
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Text(text.initials.toUpperCase(),
                  style: textStyle ?? context.textTheme.bodySmall),
            ),
    );
  }
}
