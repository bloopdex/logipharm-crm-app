import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class TourStatusCard extends StatelessWidget {
  final int flag;
  const TourStatusCard({
    super.key,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = kCodGray.shade100;
    Color color = kCodGray;
    String status = context.i10n.tourPendingStatus;
    switch (flag) {
      case 0:
        backgroundColor = kCodGray.shade100;
        color = kCodGray;
        status = context.i10n.tourPendingStatus;
        break;
      case 1:
        backgroundColor = kBrightSun.shade100;
        color = kBrightSun.shade600;
        status = context.i10n.tourInProgressStatus;
        break;
      case 2:
        backgroundColor = kCeruleanBlue.shade100;
        color = kPrimaryColor;
        status = context.i10n.tourCompletedStatus;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kPaddingSm3,
        vertical: kPaddingSm1,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kSpacingX1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.sp,
            height: 6.sp,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: kSpacingX2),
          Text(
            status,
            style: context.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
