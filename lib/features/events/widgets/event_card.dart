import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../event_detail_page.dart'; // Ensure you have an EventDetailPage
import '../models/event/event.dart';
import 'event_status_widget.dart'; // Ensure you have an EventStatusWidget

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    // Prefer textual `statut` when provided; fallback to numeric `type`.
    final statusFlag = event.statut ??
        (event.type == 0
            ? 'EN_ATTENTE'
            : event.type == 1
                ? 'EN_COURS'
                : 'TERMINE');

    Color textColor;
    switch (statusFlag) {
      case 'EN_ATTENTE':
        textColor = kBrightSun.shade600;
        break;
      case 'EN_COURS':
        textColor = kCeruleanBlue;
        break;
      case 'TERMINE':
        textColor = kSuccessColor;
        break;
      default:
        textColor = kCodGray;
        break;
    }

    return InkWell(
      onTap: () {
        context.push(
          EventDetailPage(event: event),
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
                      child: Text(
                        DateFormat("d\nMMM").format(
                          DateTime.parse(event.date.toString()),
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
                          event.titre ?? context.i10n.noTitle,
                          style: context.textTheme.headlineMedium,
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
                                event.creerPar ?? context.i10n.noCreator,
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
              EventStatusWidget(
                flag: statusFlag,
              ),
              Text(
                DateFormat("dd MMM yyyy").format(
                  DateTime.parse(event.date.toString()),
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
