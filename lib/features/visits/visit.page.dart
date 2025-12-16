import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:crm/features/visits/bloc/visits/visit_bloc.dart';
import 'package:crm/features/visits/update-visit.page.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../logic/time.range/time_range_cubit.dart';
import '../../shared/widgets/image/svg.dart';
import 'visit-detail.page.dart' as general_visit_detail;

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
                loaded: (visits, hasReachedMax, __) {
                  if (visits.isEmpty) {
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
                  // Group visits by date (yyyy-MM-dd)
                  final Map<String, List<TourDetail>> groups = {};
                  for (final v in visits) {
                    final key = _dateKey(v.startDate);
                    groups.putIfAbsent(key, () => []).add(v);
                  }
                  final keys = groups.keys.toList()
                    ..sort((a, b) => b.compareTo(a));

                  final items = <_GroupItem>[];
                  for (final k in keys) {
                    items.add(_GroupItem.header(k));
                    for (final v in groups[k]!) {
                      items.add(_GroupItem.item(v));
                    }
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final it = items[index];
                      if (it.isHeader) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(kPaddingMd2, kPaddingMd2,
                              kPaddingMd2, kPaddingSm2),
                          child: Text(
                            _displayDate(context, it.header!),
                            style: context.textTheme.titleMedium,
                          ),
                        );
                      }
                      final visit = it.visit!;
                      return GestureDetector(
                        key: Key(visit.id.toString()),
                        onTap: () {
                          context.push(general_visit_detail.VisitDetailPage(
                              visit: visit));
                        },
                        onLongPress: () {
                          context.push(UpdateVisitPage(tour: visit));
                        },
                        child: VisitCard(visit: visit),
                      );
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

String _dateKey(String? iso) {
  if (iso == null || iso.isEmpty) return '—';
  try {
    final d = DateTime.tryParse(iso);
    if (d == null) return iso;
    return DateFormat('yyyy-MM-dd').format(d);
  } catch (_) {
    return iso;
  }
}

String _displayDate(BuildContext context, String isoOrKey) {
  try {
    final d = DateTime.tryParse(isoOrKey) ?? DateTime.parse(isoOrKey);
    return DateFormat.yMMMMd(Localizations.localeOf(context).toString())
        .format(d);
  } catch (_) {
    return isoOrKey;
  }
}

class _GroupItem {
  final String? header;
  final TourDetail? visit;
  final bool isHeader;

  _GroupItem.header(this.header)
      : visit = null,
        isHeader = true;

  _GroupItem.item(this.visit)
      : header = null,
        isHeader = false;
}

class VisitCard extends StatelessWidget {
  final TourDetail visit;

  const VisitCard({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(visit.id.toString()),
      onLongPress: () {
        context.push(UpdateVisitPage(tour: visit));
      },
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPaddingMd1,
        ),
        title: Text(
          visit.pharmacy?.fullName ?? "",
          maxLines: 1,
          style: context.textTheme.bodyLarge,
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
              child: Text(visit.reason?.label ?? "",
                  style: context.textTheme.bodyLarge),
            ),
            SizedBox(height: kSpacingX1),
            Text(
              visit.delegate?.fullName ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium,
            ),
            Text(
              visit.masterTourTitle ?? context.i10n.noTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
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
