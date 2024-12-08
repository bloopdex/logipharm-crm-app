import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../image/custom_local_image.widget.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.message, required this.onRetry});
  final String message;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => onRetry(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height,
            minWidth: context.width,
            maxHeight: context.height,
            maxWidth: context.width,
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomLocalImage(image: 'errors/404.png', width: 300.h),
                  SizedBox(height: kSpacingX2),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kCeruleanBlue),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
