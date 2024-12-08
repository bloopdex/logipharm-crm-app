import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/core.dart';
import '../image/custom_local_image.widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgGrayVisibility1,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLocalImage(image: 'logo.png', width: 145.h),
          SizedBox(height: kSpacingX3),
          LoadingAnimationWidget.staggeredDotsWave(
            color: kCeruleanBlue,
            size: 30.h,
          ),
        ],
      )),
    );
  }
}
