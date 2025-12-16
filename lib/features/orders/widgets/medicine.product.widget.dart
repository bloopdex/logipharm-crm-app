import 'package:crm/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/image/svg.dart';

class DefaultMedicamentProduct extends StatelessWidget {
  const DefaultMedicamentProduct({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 65.h,
      height: height ?? 65.h,
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: kCeruleanBlue.shade100.withAlpha(100),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: SVG(
        'medicament.svg',
        width: 49.h,
        height: 49.h,
        fit: BoxFit.contain,
        icon: true,
      ),
    );
  }
}
