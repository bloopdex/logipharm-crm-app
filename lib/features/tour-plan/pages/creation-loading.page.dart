import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TourCreationLoadingPage extends StatelessWidget {
  const TourCreationLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingMd2,
            vertical: kPaddingMd2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.i10n.tourCreationInProgressTitle,
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge,
              ),
              SizedBox(height: kSpacingX5),
              Text(
                context.i10n.tourCreationInProgressDescription,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(height: kSpacingX12),
              LoadingAnimationWidget.prograssiveDots(
                  color: kPrimaryColor, size: 50.sp)
            ],
          )),
    );
  }
}
