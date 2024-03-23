import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../core/core.dart';
import '../../shared/widgets/buttons/circlebutton.text.widget.dart';
import '../tour-plan/bloc/tour_plan_bloc.dart';
import '../tour-plan/core/enums.dart';
import '../tour-plan/models/tour.dart';
import '../tour-plan/widget/current.plan.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kSpacingX5),
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
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TourPlanBloc, TourPlanState>(builder: (context, state) {
              final Tour? current = state.maybeWhen(
                loaded: (tours, hasReachedMax, currentPage) {
                  return tours
                      .where((element) =>
                          element.statusFlag == StatuFlags.closed.value)
                      .firstOrNull;
                },
                orElse: () => null,
              );
              return Column(children: [
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
                      SizedBox(height: kSpacingX5),
                    ],
                  ),
              ]);
            }),
            Row(
              children: [
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.offline_bolt_rounded,
                    text: context.i10n.homeCreateNewPlan,
                  ),
                ),
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.fact_check_rounded,
                    text: context.i10n.homeCreateNewVisit,
                  ),
                ),
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.event_rounded,
                    text: context.i10n.homeCreateNewEvent,
                  ),
                ),
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.person_add_rounded,
                    text: context.i10n.homeHireNewClient,
                  ),
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Text(
              context.i10n.homeMyClients,
              style: context.textTheme.headlineSmall,
            ),
            SizedBox(height: kSpacingX2),
            Container(
              height: 200.sp,
              width: context.width,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingX3),
              ),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(36.7525, 3.04197),
                  initialZoom: 12,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.a2sdz.crm',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
