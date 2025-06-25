import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/core/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/search/search_cubit.dart';
import '../../../logic/time.range/time_range_cubit.dart';
import '../../../shared/widgets/image/svg.dart';
import '../../../shared/widgets/loading/loader.widget.dart';
import '../bloc/tour-plan/tour_plan_bloc.dart';
import '../models/tour.dart';
import 'tour.plan.card.dart';

class TourTabListWidget extends StatefulWidget {
  final TourPlanState state;
  const TourTabListWidget({super.key, required this.state});

  @override
  State<TourTabListWidget> createState() => _TourTabListWidgetState();
}

class _TourTabListWidgetState extends State<TourTabListWidget> with TickerProviderStateMixin {
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
            Tab(
              text: context.i10n.tourAllPlans,
            ),
            Tab(
              text: context.i10n.tourPendingPlans,
            ),
            Tab(
              text: context.i10n.tourInProgressPlans,
            ),
            Tab(
              text: context.i10n.tourCompletedPlans,
            ),
          ],
        ),
        SizedBox(height: kSpacingX4),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              TourListWidget(state: widget.state, flag: StatuFlags.all.value),
              TourListWidget(state: widget.state, flag: StatuFlags.pending.value),
              TourListWidget(state: widget.state, flag: StatuFlags.opened.value),
              TourListWidget(state: widget.state, flag: StatuFlags.closed.value),
            ],
          ),
        ),
      ],
    );
  }
}

class TourListWidget extends StatefulWidget {
  const TourListWidget({
    super.key,
    required this.state,
    required this.flag,
  });

  final int flag;
  final TourPlanState state;

  @override
  State<TourListWidget> createState() => _TourListWidgetState();
}

class _TourListWidgetState extends State<TourListWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(load);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.state.maybeWhen(
      loaded: (tours, hasReachedMax, currentPage, goal) {
        if (tours.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SVG(
                'empty-states/info.svg',
                height: 175.h,
              ),
              SizedBox(height: kSpacingX3),
              Text(
                context.i10n.tourEmptyPlans,
                style: context.textTheme.headlineMedium,
              ),
              SizedBox(height: kSpacingX2),
              Text(
                context.i10n.tourEmptyPlansDescription,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ));
        }
        // filter tours by status
        final List<Tour> filteredList;
        if (widget.flag != StatuFlags.all.value) {
          filteredList = tours.where((element) => element.statusFlag == widget.flag).toList();
        } else {
          filteredList = tours;
        }
        return RefreshIndicator(
          onRefresh: () async {
            context.read<SearchCubit>().reset();
            context.read<TimeRangeCubit>().reset();
            context.read<TourPlanBloc>().add(
                  const TourPlanEvent.started(),
                );
          },
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            itemCount: filteredList.length,
            separatorBuilder: (context, index) => SizedBox(height: kSpacingX3),
            itemBuilder: (context, index) {
              if (index == filteredList.length && !hasReachedMax) {
                return const Center(
                  child: Loader(),
                );
              }
              return TourPlanCard(tour: filteredList[index]);
            },
          ),
        );
      },
      orElse: () => const Center(
        child: Loader(),
      ),
    );
  }

  void load() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      context.read<TourPlanBloc>().add(TourPlanEvent.load(
            query: context.read<SearchCubit>().state,
            start: context.read<TimeRangeCubit>().state.validatedStartDate,
            end: context.read<TimeRangeCubit>().state.validatedEndDate,
          ));
    }
  }
}
