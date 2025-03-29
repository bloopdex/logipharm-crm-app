import 'package:crm/core/core.dart';
import 'package:crm/features/hiring/models/hire.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HireDetails extends StatelessWidget {
  final Hire hire;

  const HireDetails({super.key, required this.hire});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.hireDetails,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
          constraints: BoxConstraints(
            minHeight: context.height - context.appBarSize - context.paddingBottom,
            maxHeight: context.height - context.appBarSize - context.paddingBottom,
            minWidth: context.width,
            maxWidth: context.width,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingLg2),
                child: Row(
                  children: [
                    Container(
                      width: 38.h,
                      height: 38.h,
                      padding: EdgeInsets.all(kPaddingSm1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                        border: Border.all(color: kPrimaryColor, width: 2),
                      ),
                      child: const Icon(Icons.cached_rounded, color: Colors.white),
                    ),
                    SizedBox(width: kSpacingX1),
                    Expanded(
                      child: Container(
                          width: 180.h,
                          height: 5.h,
                          color: hire.statusFlag == 0
                              ? kPrimaryColor
                              : hire.statusFlag == 1
                                  ? kSuccessColor
                                  : kCardinal),
                    ),
                    SizedBox(width: kSpacingX1),
                    Container(
                      width: 38.h,
                      height: 38.h,
                      padding: EdgeInsets.all(kPaddingSm1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: hire.statusFlag == 0
                            ? kWhite
                            : hire.statusFlag == 1
                                ? kSuccessColor
                                : kCardinal,
                        border: Border.all(
                            color: hire.statusFlag == 0
                                ? kBorder3
                                : hire.statusFlag == 1
                                    ? kSuccessColor
                                    : kCardinal,
                            width: 2),
                      ),
                      child: hire.statusFlag == 0
                          ? const SizedBox.shrink()
                          : hire.statusFlag == 1
                              ? const Icon(Icons.how_to_reg_rounded, color: Colors.white)
                              : const Icon(Icons.clear_rounded, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingX2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingLg1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70.h,
                      child: Text(
                        context.i10n.homePendingHire,
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(
                      width: 70.h,
                      child: Text(
                        hire.statusFlag == 0
                            ? context.i10n.waitingForDecision
                            : hire.statusFlag == 1
                                ? context.i10n.hired
                                : context.i10n.rejected,
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingX3),
              ProfileCard(
                size: 100,
                text: '${hire.firstName} ${hire.lastName}',
                textStyle: context.textTheme.displayMedium,
              ),
              SizedBox(height: kSpacingX6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingMd1),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorder3, width: 1),
                  borderRadius: BorderRadius.circular(kSpacingX2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.i10n.note,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(width: kSpacingX1),
                    Expanded(
                      child: Text(
                        hire.remark ?? context.i10n.noNote,
                        softWrap: true,
                        textAlign: TextAlign.end,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingX5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kBorder3, width: 1),
                  borderRadius: BorderRadius.circular(kSpacingX2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: kPaddingMd2,
                            left: kPaddingMd2,
                            top: kPaddingMd2,
                            bottom: kPaddingSm3,
                          ),
                          child: Text(
                            context.i10n.firstName,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                          child: Text(
                            hire.firstName ?? context.i10n.noFirstName,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: kBorder3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                          child: Text(
                            context.i10n.lastName,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                          child: Text(
                            hire.lastName ?? context.i10n.noLastName,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: kBorder3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                          child: Text(
                            context.i10n.email,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                          child: Text(
                            hire.email ?? context.i10n.noEmail,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: kBorder3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: kPaddingMd2,
                            left: kPaddingMd2,
                            bottom: kPaddingMd2,
                            top: kPaddingSm3,
                          ),
                          child: Text(
                            context.i10n.phone,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: kPaddingMd2,
                            left: kPaddingMd2,
                            bottom: kPaddingMd2,
                            top: kPaddingSm3,
                          ),
                          child: Text(
                            hire.telephone ?? context.i10n.noPhone,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingX5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kBorder3, width: 1),
                  borderRadius: BorderRadius.circular(kSpacingX2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: kPaddingMd2,
                            left: kPaddingMd2,
                            top: kPaddingMd2,
                            bottom: kPaddingSm3,
                          ),
                          child: Text(
                            context.i10n.region,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                          child: Text(
                            hire.regionName,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: kBorder3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                          child: Text(
                            context.i10n.address,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kPaddingMd2, vertical: kPaddingSm3),
                            child: Text(
                              hire.address ?? context.i10n.noAddress,
                              textAlign: TextAlign.end,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
