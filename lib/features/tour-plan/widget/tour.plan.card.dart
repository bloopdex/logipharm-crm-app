import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/tour.dart';
import '../tour-plan-details.page.dart';
import 'tour.status.widget.dart';

class TourPlanCard extends StatelessWidget {
  final Tour tour;
  const TourPlanCard({
    super.key,
    required this.tour,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = kCodGray;
    switch (tour.statusFlag) {
      case 0:
        textColor = kCodGray;
        break;
      case 1:
        textColor = kBrightSun.shade600;
        break;
      case 2:
        textColor = kPrimaryColor;
        break;
    }
    return InkWell(
      onTap: () {
        context.push(
          TourPlanDetailPage(tour: tour),
        );
      },
      child: Row(
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
                          tour.name ?? context.i10n.noName,
                          style: context.textTheme.headlineMedium,
                        ),
                        SizedBox(height: kSpacingX1),
                        Text(
                          context.i10n.tourClient(tour.pharmacies?.length ?? 0),
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
                              size: 20.h,
                            ),
                            Expanded(
                              child: Text(
                                tour.delegate.fullName,
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: kText4,
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
          Column(
            children: [
              TourStatusCard(
                flag: tour.statusFlag,
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
      ),
    );
  }
}
