import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../buttons/button.widget.dart';

class ModalBottomSheet extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final String? title;
  final String? subtitle;
  final String confirmText;
  final String? cancelText;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  final bool isDismissible;
  const ModalBottomSheet(
      {super.key,
      required this.child,
      this.icon,
      this.title,
      this.subtitle,
      required this.confirmText,
      this.cancelText,
      this.onConfirm,
      this.onCancel,
      this.isDismissible = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showCupertinoModalPopup(
            context: context,
            barrierDismissible: isDismissible,
            semanticsDismissible: isDismissible,
            builder: (BuildContext context) {
              return Container(
                constraints: BoxConstraints(
                  maxHeight: context.height * 0.6,
                  maxWidth: context.width,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: kPaddingMd2,
                  vertical: kPaddingLg1,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kSpacingX5),
                    topRight: Radius.circular(kSpacingX5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null)
                            Container(
                              width: kSpacingX13,
                              height: kSpacingX13,
                              padding: EdgeInsets.all(kSpacingX7),
                              margin: EdgeInsets.only(bottom: kSpacingX7),
                              decoration: BoxDecoration(
                                color: kCeruleanBlue.shade600,
                                shape: BoxShape.circle,
                                border: Border.all(color: kCeruleanBlue.shade900),
                              ),
                              child: icon,
                            ),
                          if (title != null)
                            Text(
                              title!,
                              textAlign: TextAlign.center,
                              style: context.textTheme.displaySmall,
                            ),
                          if (subtitle != null)
                            Container(
                              margin: EdgeInsets.only(top: kSpacingX4),
                              child: Text(
                                subtitle!,
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodyLarge,
                              ),
                            ),
                          SizedBox(height: kSpacingX10),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomButton(
                          onPressed: onConfirm,
                          text: confirmText,
                        ),
                        if (cancelText != null)
                          Container(
                            margin: EdgeInsets.only(top: kSpacingX4),
                            child: CustomButton(
                              onPressed: onCancel,
                              backgroundColor: kBgButtonSecondary,
                              textColor: kText1,
                              text: cancelText!,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              );
            });
      },
      child: child,
    );
  }
}
