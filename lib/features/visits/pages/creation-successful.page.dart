import 'package:crm/features/navigation/navigation.screen.dart';
import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../shared/widgets/image/svg.dart';

class VisitCreationSuccessfulPage extends StatelessWidget {
  const VisitCreationSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCeruleanBlue.shade900,
      appBar: AppBar(
        backgroundColor: kCeruleanBlue.shade900,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: kPaddingMd2,
          right: kPaddingMd2,
          bottom: context.paddingBottom,
        ),
        constraints: BoxConstraints(
          maxHeight: context.height,
          maxWidth: context.width,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140.h,
                    height: 140.h,
                    padding: EdgeInsets.all(kSpacingX8),
                    decoration: BoxDecoration(
                      color: kCeruleanBlue.shade600,
                      shape: BoxShape.circle,
                      border: Border.all(color: kCeruleanBlue.shade900),
                    ),
                    child: SVG(
                      'visit.svg',
                      icon: true,
                      height: 20.h,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: kSpacingX10),
                  Text(
                    context.i10n.visitCreationSuccessTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.displayLarge!.copyWith(color: kWhite),
                  ),
                  SizedBox(height: kSpacingX4),
                  Text(
                    context.i10n.visitCreationSuccessDescription,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style: context.textTheme.bodyLarge!.copyWith(color: kWhite),
                  ),
                ],
              ),
            ),
            CustomButton(
              text: context.i10n.finish,
              onPressed: () {
                context.pushAndRemoveUntil(const NavigationScreen());
              },
            ),
            SizedBox(height: kPaddingLg1),
          ],
        ),
      ),
    );
  }
}
