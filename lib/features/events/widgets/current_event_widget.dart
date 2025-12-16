import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../event_detail_page.dart';
import '../models/event/event.dart';

class CurrentEventWidget extends StatelessWidget {
  final Event event;
  const CurrentEventWidget({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(EventDetailPage(event: event));
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
                      child: Text(
                        DateFormat("d\nMMM").format(
                          DateTime.parse(event.date.toString()),
                        ),
                        textAlign: TextAlign.center,
                        style: context.textTheme.displaySmall!.copyWith(
                          color: (event.statut ??
                                      (event.type == 0
                                          ? 'EN_ATTENTE'
                                          : event.type == 1
                                              ? 'EN_COURS'
                                              : 'TERMINE')) ==
                                  'EN_COURS'
                              ? kCeruleanBlue
                              : kBrightSun.shade600,
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
                          event.titre ?? context.i10n.noTitle,
                          style: context.textTheme.displaySmall!.copyWith(
                            color: kTextLight,
                          ),
                        ),
                        SizedBox(height: kSpacingX1),
                        Text(
                          context.i10n.eventType,
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
                                event.creerPar ?? context.i10n.noCreator,
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
          ],
        ),
      ),
    );
  }
}
