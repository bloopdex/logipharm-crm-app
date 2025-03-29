import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/loading/loader.widget.dart';
import '../blocs/events/events_cubit.dart';
import '../models/event/event.dart';
import 'event_card.dart';

class EventListWidget extends StatefulWidget {
  final String? flag;
  final EventsState state;

  const EventListWidget({super.key, required this.state, required this.flag});

  @override
  State<EventListWidget> createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventListWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(load);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.state.maybeWhen(
      loaded: (events) {
        if (events.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.i10n.noEvents,
                  style: context.textTheme.headlineMedium,
                ),
                SizedBox(height: kSpacingX2),
                Text(
                  context.i10n.noEventsDescription,
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }

        final List<Event> filteredEvents = widget.flag == null
            ? events
            : events.where((event) => event.statut == widget.flag).toList();

        return RefreshIndicator(
          onRefresh: () async {
            context.read<EventsCubit>().reset();
            context.read<EventsCubit>().loadEvents();
          },
          child: ListView.separated(
            controller: scrollController,
            itemCount: filteredEvents.length,
            separatorBuilder: (context, index) => SizedBox(height: kSpacingX3),
            itemBuilder: (context, index) {
              return EventCard(event: filteredEvents[index]);
            },
          ),
        );
      },
      orElse: () => const Center(child: Loader()),
    );
  }

  void load() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      context.read<EventsCubit>().loadEvents();
    }
  }
}
