import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/tour.dart';
import '../tour-plan-details.page.dart';

class CurrentWidgetCard extends StatelessWidget {
  final Tour tour;
  const CurrentWidgetCard({
    super.key,
    required this.tour,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          TourPlanDetailPage(tour: tour),
        );
      },
      child: Container(
        padding: EdgeInsets.all(kPaddingMd2),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kPaddingSm3),
          border: Border.all(
            color: kPrimaryColor,
            width: 2.h,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(kPaddingSm3),
                    decoration: BoxDecoration(
                      color: kCodGray.shade100,
                      borderRadius: BorderRadius.circular(kPaddingSm3),
                    ),
                    child: Center(
                      // Use Center to align the text widget inside the container
                      child: Text(
                        DateFormat("d\nMMM").format(
                          DateTime.parse(tour.startDate),
                        ),
                        textAlign: TextAlign.center,
                        style: context.textTheme.displaySmall!.copyWith(
                          color: kBrightSun.shade600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: kSpacingX4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tour.regionName ?? context.i10n.noRegion,
                          style: context.textTheme.displaySmall!.copyWith(
                            color: kTextLight,
                          ),
                        ),
                        SizedBox(height: kSpacingX1),
                        Text(
                          context.i10n.tourClient(tour.pharmacies?.length ?? 0),
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: kTextLight,
                          ),
                        ),
                        SizedBox(height: kSpacingX1),
                        Row(
                          children: [
                            Icon(Icons.person, color: kWhite),
                            Expanded(
                              child: Text(
                                tour.delegate.fullName,
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: kTextLight,
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
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                  context.i10n.tourProgress((tour.visitedClients! /
                          (tour.totalClients! != 0 ? tour.totalClients! : 1) *
                          100)
                      .toInt()),
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kTextLight,
                  )),
            ),
            LinearProgressIndicator(
              backgroundColor: kCeruleanBlue.shade500,
              color: kBgGrayVisibility2,
              borderRadius: BorderRadius.circular(kRadiusRounded),
              minHeight: 5.h,
              semanticsValue:
                  "${(tour.visitedClients! / (tour.totalClients! != 0 ? tour.totalClients! : 1) * 100).toInt()}%",
              semanticsLabel: context.i10n.tourProgress(
                  tour.visitedClients! ~/ (tour.totalClients! != 0 ? tour.totalClients! : 1)),
              value: tour.visitedClients! / (tour.totalClients! != 0 ? tour.totalClients! : 1),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentWidgetCardSupervisor extends StatelessWidget {
  final Tour tour;
  const CurrentWidgetCardSupervisor({
    super.key,
    required this.tour,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          TourPlanDetailPage(tour: tour),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 200.h,
        ),
        padding: EdgeInsets.all(kPaddingMd2),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kPaddingSm3),
          border: Border.all(
            color: kPrimaryColor,
            width: 2.h,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(kPaddingSm3),
                    decoration: BoxDecoration(
                      color: kCodGray.shade100,
                      borderRadius: BorderRadius.circular(kPaddingSm3),
                    ),
                    child: Center(
                      // Use Center to align the text widget inside the container
                      child: Text(
                        DateFormat("d\nMMM").format(
                          DateTime.parse(tour.startDate),
                        ),
                        textAlign: TextAlign.center,
                        style: context.textTheme.displaySmall!.copyWith(
                          color: kBrightSun.shade600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: kSpacingX4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tour.regionName ?? context.i10n.noRegion,
                          style: context.textTheme.displaySmall!.copyWith(
                            color: kTextLight,
                          ),
                        ),
                        SizedBox(height: kSpacingX1),
                        Text(
                          context.i10n.tourClient(tour.pharmacies?.length ?? 0),
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: kTextLight,
                          ),
                        ),
                        SizedBox(height: kSpacingX1),
                        Row(
                          children: [
                            Icon(Icons.person, color: kWhite),
                            Expanded(
                              child: Text(
                                tour.delegate.fullName,
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: kTextLight,
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
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                  context.i10n.tourProgress((tour.visitedClients! /
                          (tour.totalClients! != 0 ? tour.totalClients! : 1) *
                          100)
                      .toInt()),
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kTextLight,
                  )),
            ),
            LinearProgressIndicator(
              backgroundColor: kCeruleanBlue.shade500,
              color: kBgGrayVisibility2,
              borderRadius: BorderRadius.circular(kRadiusRounded),
              minHeight: 5.h,
              semanticsValue:
                  "${(tour.visitedClients! / (tour.totalClients! != 0 ? tour.totalClients! : 1) * 100).toInt()}%",
              semanticsLabel: context.i10n.tourProgress(
                  tour.visitedClients! ~/ (tour.totalClients! != 0 ? tour.totalClients! : 1)),
              value: tour.visitedClients! / (tour.totalClients! != 0 ? tour.totalClients! : 1),
            ),
          ],
        ),
      ),
    );
  }
}
