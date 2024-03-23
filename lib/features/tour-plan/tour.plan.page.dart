import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';
import '../../logic/search/search_cubit.dart';
import '../../logic/time.range/time_range_cubit.dart';
import '../../shared/utils/date.formatter.dart';
import '../../shared/widgets/image/svg.dart';
import '../../shared/widgets/inputs/daterange.picker.input.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';
import '../../shared/widgets/loading/loader.widget.dart';
import 'bloc/tour_plan_bloc.dart';
import 'core/enums.dart';
import 'models/tour.dart';
import 'widget/current.plan.widget.dart';
import 'widget/status.tabbar.widget.dart';
import 'widget/tour.plan.card.dart';

class PlanTourPage extends StatefulWidget {
  const PlanTourPage({super.key});

  @override
  State<PlanTourPage> createState() => _PlanTourPageState();
}

class _PlanTourPageState extends State<PlanTourPage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
      constraints: BoxConstraints(
        maxWidth: context.width,
        minWidth: context.width,
        maxHeight: context.height -
            context.appBarSize -
            context.bottomNavigationBarSize,
        minHeight: context.height -
            context.appBarSize -
            context.bottomNavigationBarSize,
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SearchCubit, String>(
            listener: (context, state) {
              context.read<TourPlanBloc>().add(
                    TourPlanEvent.search(
                      query: state,
                      start: context
                          .read<TimeRangeCubit>()
                          .state
                          .validatedStartDate,
                      end:
                          context.read<TimeRangeCubit>().state.validatedEndDate,
                    ),
                  );
            },
          ),
          BlocListener<TimeRangeCubit, TimeRangeState>(
            listener: (context, state) {
              context.read<TourPlanBloc>().add(
                    TourPlanEvent.search(
                      query: context.read<SearchCubit>().state,
                      start: state.validatedStartDate,
                      end: state.validatedEndDate,
                    ),
                  );
            },
          ),
        ],
        child: BlocBuilder<TourPlanBloc, TourPlanState>(
          builder: (context, state) {
            final Tour? current = state.maybeWhen(
              loaded: (tours, hasReachedMax, currentPage) {
                return tours
                    .where((element) =>
                        element.statusFlag == StatuFlags.closed.value)
                    .firstOrNull;
              },
              orElse: () => null,
            );
            return Column(
              children: [
                if (current != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.i10n.tourCurrentTour,
                        style: context.textTheme.displaySmall,
                      ),
                      SizedBox(height: kSpacingX4),
                      CurrentWidgetCard(tour: current),
                      SizedBox(height: kSpacingX6),
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                      child: SearchTextField(
                        hintText: context.i10n.tourSearchPerWilaya,
                      ),
                    ),
                    SizedBox(width: kSpacingX2),
                    const CustomDateRangePicker()
                  ],
                ),
                BlocBuilder<TimeRangeCubit, TimeRangeState>(
                  builder: (context, state) {
                    if (state.validatedStartDate != null &&
                        state.validatedEndDate != null) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: kSpacingX4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              DateHelper.ddMMYYYY(state.validatedStartDate!),
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: kBgGrayVisibility5,
                              ),
                            ),
                            SizedBox(width: kSpacingX4),
                            Icon(Icons.arrow_forward,
                                size: 20.sp, color: kBgGrayVisibility4),
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
                const TourStatusTabBar(),
                SizedBox(height: kSpacingX4),
                Expanded(
                  child: state.maybeWhen(
                    loaded: (tours, hasReachedMax, currentPage) {
                      if (tours.isEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SVG(
                              'empty-states/info.svg',
                              height: 175.sp,
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
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<SearchCubit>().reset();
                          context.read<TimeRangeCubit>().reset();
                          context.read<TourPlanBloc>().add(
                                const TourPlanEvent.started(),
                              );
                        },
                        child: ListView.separated(
                          controller: controller,
                          itemCount: tours.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: kSpacingX3),
                          itemBuilder: (context, index) {
                            if (index == tours.length && !hasReachedMax) {
                              return const Center(
                                child: Loader(),
                              );
                            }
                            return TourPlanCard(tour: tours[index]);
                          },
                        ),
                      );
                    },
                    orElse: () => const Center(
                      child: Loader(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void load() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      context.read<TourPlanBloc>().add(TourPlanEvent.load(
            query: context.read<SearchCubit>().state,
            start: context.read<TimeRangeCubit>().state.validatedStartDate,
            end: context.read<TimeRangeCubit>().state.validatedEndDate,
          ));
    }
  }
}
