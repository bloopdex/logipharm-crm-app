import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/time.range/time_range_cubit.dart';
import '../../shared/utils/date.formatter.dart';
import 'blocs/events/events_cubit.dart';
import 'widgets/event_tab_list_widget.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.eventsTitle),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
        constraints: BoxConstraints(
          maxWidth: context.width,
          maxHeight: context.height - context.appBarSize - context.bottomNavigationBarSize,
        ),
        child: MultiBlocListener(
          listeners: [
            BlocListener<TimeRangeCubit, TimeRangeState>(
              listener: (context, state) {
                context.read<EventsCubit>().loadEvents(
                      startDate: state.validatedStartDate,
                      endDate: state.validatedEndDate,
                    );
              },
            ),
          ],
          child: Column(
            children: [
              BlocBuilder<TimeRangeCubit, TimeRangeState>(
                builder: (context, state) {
                  if (state.validatedStartDate != null && state.validatedEndDate != null) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: kSpacingX4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateHelper.ddMMYYYY(state.validatedStartDate!),
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: kBgGrayVisibility5,
                            ),
                          ),
                          SizedBox(width: kSpacingX4),
                          Icon(Icons.arrow_forward, size: 20.h, color: kBgGrayVisibility4),
                          SizedBox(width: kSpacingX4),
                          Text(
                            DateHelper.ddMMYYYY(state.validatedEndDate!),
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: kBgGrayVisibility5,
                            ),
                          ),
                          SizedBox(width: kSpacingX4),
                          InkWell(
                            onTap: () {
                              context.read<TimeRangeCubit>().reset();
                            },
                            child: Icon(
                              Icons.cancel,
                              size: kSpacingX7,
                              color: kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              Expanded(
                child: BlocBuilder<EventsCubit, EventsState>(
                  builder: (context, state) {
                    return EventTabListWidget(state: state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
