import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../core/enums.dart';
import '../models/tour.dart';

class CurrentWidgetCard extends StatelessWidget {
  final Tour tour;
  const CurrentWidgetCard({
    super.key,
    required this.tour,
  });

  @override
  Widget build(BuildContext context) {
    int totalClients = tour.tourDetails.length;
    double percentage = totalClients == 0
        ? 0
        : (tour.tourDetails
                    .where((detail) =>
                        detail.statusFlag == StatuFlags.closed.value)
                    .length /
                totalClients) *
            100;

    return Container(
      padding: EdgeInsets.all(kPaddingMd2),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(kPaddingSm3),
        border: Border.all(
          color: kPrimaryColor,
          width: 2.sp,
        ),
      ),
      child: Column(
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
                        tour.regionName,
                        style: context.textTheme.displaySmall!.copyWith(
                          color: kTextLight,
                        ),
                      ),
                      SizedBox(height: kSpacingX1),
                      Text(
                        context.i10n.tourClient(tour.tourDetails.length),
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: kTextLight,
                        ),
                      ),
                      SizedBox(height: kSpacingX1),
                      Row(
                        children: [
                          Icon(Icons.person, color: kWhite),
                          Text(
                            tour.delegate.fullName,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: kTextLight,
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
            child: Text(context.i10n.tourProgress(percentage.toInt()),
                style: context.textTheme.bodyMedium!.copyWith(
                  color: kTextLight,
                )),
          ),
          LinearProgressIndicator(
            backgroundColor: kCeruleanBlue.shade500,
            color: kBgGrayVisibility2,
            borderRadius: BorderRadius.circular(kRadiusRounded),
            minHeight: 5.sp,
            semanticsValue: "$percentage%",
            semanticsLabel: context.i10n.tourProgress(percentage.toInt()),
            value: percentage,
          ),
        ],
      ),
    );
  }
}
