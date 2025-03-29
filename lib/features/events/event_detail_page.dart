import 'package:crm/core/core.dart';
import 'package:crm/features/events/visit_detail_page.dart';
import 'package:crm/features/events/widgets/event_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'add_visit_to_event_page.dart';
import 'blocs/visits/event_visits_bloc.dart';
import 'models/event/event.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventVisitsBloc()..add(EventVisitsEvent.started(id: event.id!)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              size: kSpacingX7,
              color: kWhite,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text(
            context.i10n.eventDetailsTitle,
            style: context.textTheme.headlineMedium!.copyWith(color: kWhite),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.push(AddVisitToEventPage(event: event));
          },
          backgroundColor: kPrimaryColor,
          label: Text(context.i10n.addVisit),
          icon: Icon(Icons.add, color: kWhite),
        ),
        body: BlocBuilder<EventVisitsBloc, EventVisitsState>(
          builder: (context, state) {
            return Container(
              constraints: BoxConstraints(
                maxHeight: context.height - context.appBarSize - context.paddingBottom,
                minHeight: context.height - context.appBarSize - context.paddingBottom,
                maxWidth: context.width,
                minWidth: context.width,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(context.width * 2, context.width / 3),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60.h,
                        height: 60.h,
                        padding: EdgeInsets.all(kPaddingSm3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBgGrayVisibility2,
                          borderRadius: BorderRadius.circular(kSpacingX4),
                        ),
                        child: Icon(Icons.event, size: kSpacingX9, color: kBgGrayVisibility6),
                      ),
                      SizedBox(height: kSpacingX5),
                      Text(
                        context.i10n.eventTitle,
                        style: context.textTheme.bodyMedium,
                      ),
                      SizedBox(height: kSpacingX1),
                      Text(
                        event.titre ?? context.i10n.noTitle,
                        style: context.textTheme.displaySmall,
                      ),
                      SizedBox(height: kSpacingX3),
                      Center(child: EventStatusWidget(flag: event.statut)),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: kPaddingSm3,
                          horizontal: kPaddingMd2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.i10n.createdAt,
                              style: context.textTheme.headlineSmall,
                            ),
                            Text(
                              DateFormat("dd MMM yyyy").format(
                                DateTime.parse(event.date.toString()),
                              ),
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: kPaddingSm3,
                          horizontal: kPaddingMd2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.i10n.eventDetailsCreatedBy,
                              style: context.textTheme.headlineSmall,
                            ),
                            Text(
                              event.creerPar ?? context.i10n.noCreator,
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Expanded(
                        child: state.maybeWhen(
                          loaded: (eventVisits, hasReachedMax, currentPage) {
                            return ListView.builder(
                              itemCount: eventVisits.length,
                              itemBuilder: (context, index) {
                                final visit = eventVisits[index];
                                return ListTile(
                                  onTap: () {
                                    context.push(VisitDetailPage(visit: visit));
                                  },
                                  title: Text('${visit.nom ?? ''} ${visit.prenom ?? ''}'),
                                  subtitle: Text(DateFormat("dd MMM yyyy")
                                      .format(visit.date ?? DateTime.now())),
                                  trailing: Text(visit.remarque ?? 'No Remark'),
                                );
                              },
                            );
                          },
                          loading: () => const Center(child: CircularProgressIndicator()),
                          failure: (message) => Center(child: Text(message)),
                          orElse: () => const Center(child: Text('No data')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
