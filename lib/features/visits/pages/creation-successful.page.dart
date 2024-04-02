import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../shared/widgets/image/svg.dart';
import '../../../shared/widgets/popup/modalbottomsheet.popup.dart';

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
                    width: 140.sp,
                    height: 140.sp,
                    padding: EdgeInsets.all(kSpacingX8),
                    decoration: BoxDecoration(
                      color: kCeruleanBlue.shade600,
                      shape: BoxShape.circle,
                      border: Border.all(color: kCeruleanBlue.shade900),
                    ),
                    child: SVG(
                      'visit.svg',
                      icon: true,
                      height: 20.sp,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: kSpacingX10),
                  Text(
                    context.i10n.visitCreationSuccessTitle,
                    textAlign: TextAlign.center,
                    style:
                        context.textTheme.displayLarge!.copyWith(color: kWhite),
                  ),
                  SizedBox(height: kSpacingX4),
                  Text(
                    context.i10n.visitCreationSuccessDescription,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge!.copyWith(color: kWhite),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomButton(
                  text: context.i10n.finish,
                  onPressed: () {
                    context.pop();
                  },
                ),
                SizedBox(height: kSpacingX5),
                ModalBottomSheet(
                  icon: const SVG('tour.svg', icon: true),
                  confirmText: context.i10n.viewDetails,
                  cancelText: context.i10n.later,
                  title: context.i10n.tourCreationStartTour,
                  subtitle: context.i10n.tourCreationStartTourDescription,
                  child: CustomButton(
                    text: context.i10n.viewDetails,
                    backgroundColor: kBgButtonSecondary,
                    textColor: kText1,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
