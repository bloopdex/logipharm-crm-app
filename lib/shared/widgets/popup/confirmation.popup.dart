import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../buttons/button.widget.dart';

class ConfirmationPopUp extends StatelessWidget {
  const ConfirmationPopUp({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    required this.confirmText,
    required this.cancelText,
    required this.color,
    required this.iconBackground,
  });
  final IconData icon;
  final String title;
  final String? description;
  final String confirmText;
  final String cancelText;
  final Color color;
  final Color iconBackground;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSpacingX4)),
      backgroundColor: color,
      clipBehavior: Clip.hardEdge,
      content: Container(
        margin: EdgeInsets.only(top: kSpacingX1),
        padding: EdgeInsets.all(kSpacingX6),
        constraints: BoxConstraints(
          minWidth: context.width,
          maxWidth: context.width,
        ),
        decoration: BoxDecoration(
          color: kBgGrayVisibility1,
          borderRadius: BorderRadius.circular(kSpacingX4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: kSpacingX10,
              width: kSpacingX10,
              padding: EdgeInsets.all(kSpacingX2),
              decoration: BoxDecoration(color: iconBackground, shape: BoxShape.circle),
              child: Icon(icon, color: color),
            ),
            SizedBox(height: kSpacingX4),
            Text(
              title,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge!.copyWith(color: color),
            ),
            SizedBox(height: kSpacingX2),
            if (description != null)
              Text(
                description!,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
            SizedBox(height: 24.h),
            CustomButton(
              text: confirmText,
              backgroundColor: color,
              height: 44.h,
              onPressed: () => context.pop(pop: true),
            ),
            SizedBox(height: kSpacingX4),
            GestureDetector(
              onTap: () => context.pop(pop: false),
              child: Text(
                cancelText,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: kCeruleanBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
