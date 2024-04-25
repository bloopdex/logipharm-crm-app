import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class DividerContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? padding;
  final bool isBottom;
  const DividerContainer(
      {super.key,
      required this.child,
      this.color,
      this.padding,
      this.isBottom = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: padding?.sp ?? kSpacingX4, bottom: padding?.sp ?? kSpacingX4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: color ?? kBorder3,
            width: 1,
          ),
          bottom: isBottom
              ? BorderSide(
                  color: color ?? kBorder3,
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: child,
    );
  }
}
