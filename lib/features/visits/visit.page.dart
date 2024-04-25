import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:crm/features/visits/bloc/visits/visit_bloc.dart';
import 'package:crm/features/visits/update-visit.page.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/time.range/time_range_cubit.dart';
import '../../shared/widgets/image/svg.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
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
          BlocListener<TimeRangeCubit, TimeRangeState>(
            listener: (context, state) {
              context.read<VisitBloc>().add(
                    VisitEvent.search(
                      start: state.validatedStartDate,
                      end: state.validatedEndDate,
                    ),
                  );
            },
          ),
        ],
        child: BlocBuilder<VisitBloc, VisitState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<VisitBloc>().add(const VisitEvent.started());
              },
              child: state.maybeWhen(
                loaded: (visits, _, __) {
                  if (visits.isEmpty) {
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
                  return ListView.builder(
                    itemCount: visits.length,
                    itemBuilder: (context, index) {
                      return VisitCard(visit: visits[index]);
                    },
                  );
                },
                loading: () {
                  return const Center(
                    child: Loader(),
                  );
                },
                orElse: () {
                  return const Center(
                    child: Loader(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _loadMore() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<VisitBloc>().add(const VisitEvent.load());
    }
  }
}

class VisitCard extends StatelessWidget {
  final TourDetail visit;

  const VisitCard({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(visit.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: kPrimaryColor,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(Icons.edit, color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        context.push(UpdateVisitPage(tour: visit));
      },
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPaddingMd1,
        ),
        leading: ProfileCard(
          text: visit.pharmacy?.fullName ?? "",
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                visit.pharmacy?.fullName ?? "",
                maxLines: 1,
                style: context.textTheme.bodyLarge,
              ),
            ),
            SizedBox(width: kSpacingHalf),
            Text(visit.startDate ?? "", style: context.textTheme.bodySmall),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: kPaddingMd3,
                vertical: kPaddingSm1,
              ),
              width: context.width,
              decoration: BoxDecoration(
                color: kCeruleanBlue.shade100,
                borderRadius: BorderRadius.circular(kPaddingSm3),
              ),
              child:
                  Text(visit.reason ?? "", style: context.textTheme.bodyLarge),
            ),
            Text(visit.reportText ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
