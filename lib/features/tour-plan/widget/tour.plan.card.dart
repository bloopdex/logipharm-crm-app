import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/tour.dart';

class TourPlanCard extends StatelessWidget {
  final Tour tour;
  const TourPlanCard({
    super.key,
    required this.tour,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = kCodGray.shade100;
    Color textColor = kCodGray;
    String status = context.i10n.tourPendingStatus;
    switch (tour.statusFlag) {
      case 0:
        backgroundColor = kCodGray.shade100;
        textColor = kCodGray;
        status = context.i10n.tourPendingStatus;
        break;
      case 1:
        backgroundColor = kBrightSun.shade100;
        textColor = kBrightSun.shade600;
        status = context.i10n.tourInProgressStatus;
        break;
      case 2:
        backgroundColor = kCeruleanBlue.shade100;
        textColor = kPrimaryColor;
        status = context.i10n.tourCompletedStatus;
        break;
    }
    return Row(
      children: [
        Expanded(
          child: IntrinsicHeight(
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
                        color: textColor,
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
                        style: context.textTheme.headlineMedium,
                      ),
                      SizedBox(height: kSpacingX1),
                      Text(
                        context.i10n.tourClient(tour.tourDetails.length),
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: kText4,
                        ),
                      ),
                      SizedBox(height: kSpacingX1),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: kText4,
                            size: 20.sp,
                          ),
                          Text(
                            tour.delegate.fullName,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: kText4,
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
        Column(
          children: [
            StatusCard(
              backgroundColor: backgroundColor,
              bulletColor: textColor,
              status: status,
            ),
            // due date
            Text(
              DateFormat("dd MMM yyyy").format(
                DateTime.parse(tour.endDate),
              ),
              style: context.textTheme.bodyMedium!.copyWith(
                color: kText4,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class StatusCard extends StatelessWidget {
  final Color backgroundColor;
  final Color bulletColor;
  final String status;
  const StatusCard({
    super.key,
    required this.backgroundColor,
    required this.bulletColor,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kPaddingSm3,
        vertical: kPaddingSm1,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kSpacingX1),
      ),
      child: Row(
        children: [
          Container(
            width: 6.sp,
            height: 6.sp,
            decoration: BoxDecoration(
              color: bulletColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: kSpacingX2),
          Text(
            status,
            style: context.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
