import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DismissibleDeleteCard extends StatelessWidget {
  const DismissibleDeleteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kCardinal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: kSpacingX2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.h),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: kSpacingX8,
              ),
            ),
            SizedBox(
              height: kSpacingX1,
            ),
            Text(
              context.i10n.removeItem,
              style: context.textTheme.headlineMedium!.copyWith(
                color: kBgGrayVisibility1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
