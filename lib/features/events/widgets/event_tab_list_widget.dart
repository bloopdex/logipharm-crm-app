import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';

import '../blocs/events/events_cubit.dart';
import 'event_list_widget.dart';

class EventTabListWidget extends StatefulWidget {
  final EventsState state;
  const EventTabListWidget({super.key, required this.state});

  @override
  State<EventTabListWidget> createState() => _EventTabListWidgetState();
}

class _EventTabListWidgetState extends State<EventTabListWidget> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: [
            Tab(text: context.i10n.eventAll),
            Tab(text: context.i10n.eventPending), // EN_ATTENTE (1)
            Tab(text: context.i10n.eventCompleted), // TERMINE (3)
          ],
        ),
        SizedBox(height: kSpacingX4),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              EventListWidget(state: widget.state, flag: null), // All events
              EventListWidget(state: widget.state, flag: "EN_ATTENTE"), // Pending (EN_ATTENTE)
              EventListWidget(state: widget.state, flag: "TERMINE"), // Completed (TERMINE)
            ],
          ),
        ),
      ],
    );
  }
}
