import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../core/core.dart';
import '../../logic/auth/auth_bloc.dart';
import '../../shared/widgets/buttons/circlebutton.text.widget.dart';
import '../hiring/create-hire.page.dart';
import '../todo/create-event.page.dart';
import '../tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import '../tour-plan/core/enums.dart';
import '../tour-plan/create-plan.page.dart';
import '../tour-plan/models/goal/goal.dart';
import '../tour-plan/models/tour.dart';
import '../tour-plan/widget/current.plan.widget.dart';
import '../visits/create-visit.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().user;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kSpacingX5),
        constraints: BoxConstraints(
          maxWidth: context.width,
          minWidth: context.width,
          maxHeight: context.height -
              context.appBarSize -
              context.bottomNavigationBarSize -
              context.paddingBottom -
              context.paddingTop,
          minHeight: context.height -
              context.appBarSize -
              context.bottomNavigationBarSize -
              context.paddingBottom -
              context.paddingTop,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<TourPlanBloc, TourPlanState>(builder: (context, state) {
              final Goal? goal = state.maybeWhen(
                orElse: () => null,
                loaded: (tours, hasReachedMax, currentPage, goal) {
                  return goal;
                },
              );
              final Tour? current = state.maybeWhen(
                loaded: (tours, hasReachedMax, currentPage, goal) {
                  return tours
                      .where((element) => (element.statusFlag == StatuFlags.opened.value &&
                          element.delegate.id == user.id.id))
                      .firstOrNull;
                },
                orElse: () => null,
              );

              return Column(children: [
                if (goal != null)
                  Container(
                    padding: EdgeInsets.all(kPaddingMd2),
                    width: context.width,
                    margin: EdgeInsets.only(bottom: kSpacingX5),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(kPaddingSm3),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2.sp,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.i10n.goalOfDay,
                          style: context.textTheme.headlineSmall!.copyWith(color: kWhite),
                        ),
                        SizedBox(height: kSpacingX2),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${goal.visitNumber}/',
                              style: context.textTheme.headlineMedium!
                                  .copyWith(color: kWhite, fontSize: 25.h),
                            ),
                            TextSpan(
                              text: '${goal.objective}',
                              style: context.textTheme.bodyMedium!.copyWith(color: kWhite),
                            ),
                            TextSpan(
                              text: ' ${context.i10n.visitsToday}',
                              style: context.textTheme.bodyMedium!.copyWith(color: kWhite),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
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
            if (user.supervisor == 0)
              BlocBuilder<TourPlanBloc, TourPlanState>(
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return const SizedBox.shrink();
                  }, loaded: (tours, hasReachedMax, currentPage, goal) {
                    final opened = tours
                        .where((element) => element.statusFlag == StatuFlags.opened.value)
                        .toList();

                    return Container(
                      margin: EdgeInsets.only(bottom: kSpacingX5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: opened
                              .map(
                                (e) => Container(
                                    padding: EdgeInsets.symmetric(horizontal: kSpacingX2),
                                    child: CurrentWidgetCardSupervisor(tour: e)),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  });
                },
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.offline_bolt_rounded,
                    text: context.i10n.homeCreateNewPlan,
                    onPressed: () {
                      final current = context.read<TourPlanBloc>().state.maybeWhen(
                            loaded: (tours, hasReachedMax, currentPage, goal) {
                              return tours
                                  .where((element) => element.statusFlag == StatuFlags.opened.value)
                                  .firstOrNull;
                            },
                            orElse: () => null,
                          );
                      final user = context.read<AuthBloc>().user;
                      if (current == null || user.supervisor == 0) {
                        Navigator.pushNamed(context, CreatePlanPage.routeName);
                      } else {
                        context.errorSnackBar(context.i10n.cantCreatePlanWhileOpened);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.fact_check_rounded,
                    text: context.i10n.homeCreateNewVisit,
                    onPressed: () {
                      final current = context.read<TourPlanBloc>().state.maybeWhen(
                            loaded: (tours, hasReachedMax, currentPage, goal) {
                              return tours
                                  .where((element) => element.statusFlag == StatuFlags.opened.value)
                                  .firstOrNull;
                            },
                            orElse: () => null,
                          );
                      if (current != null &&
                          current.pharmacies != null &&
                          current.pharmacies!.isNotEmpty &&
                          user.supervisor != 0) {
                        context.push(
                          CreateVisitPage(
                            tour: current,
                            pharmacieId: current.pharmacies!.first.pharmacy!.id.toString(),
                          ),
                        );
                      }
                    },
                    color: context.watch<TourPlanBloc>().state.maybeWhen(
                                      loaded: (tours, hasReachedMax, currentPage, goal) {
                                        return tours
                                            .where((element) =>
                                                element.statusFlag == StatuFlags.opened.value)
                                            .firstOrNull;
                                      },
                                      orElse: () => null,
                                    ) ==
                                null ||
                            user.supervisor == 0
                        ? kBgGrayVisibility4
                        : kPrimaryColor,
                  ),
                ),
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.event_rounded,
                    text: context.i10n.homeCreateNewEvent,
                    onPressed: () {
                      context.push(const CreateEventPage());
                    },
                  ),
                ),
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.person_add_rounded,
                    text: context.i10n.homeHireNewClient,
                    onPressed: () {
                      context.push(const CreateHirePage());
                    },
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
            Expanded(
              child: Container(
                width: context.width,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingX3),
                ),
                child: BlocBuilder<TourPlanBloc, TourPlanState>(
                  builder: (context, state) {
                    final user = context.user;
                    final Tour? current = state.maybeWhen(
                      loaded: (tours, hasReachedMax, currentPage, goal) {
                        return tours
                            .where((element) => (element.statusFlag == StatuFlags.opened.value &&
                                element.delegate.id == user.id.id))
                            .firstOrNull;
                      },
                      orElse: () => null,
                    );

                    return FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLng(30.7525, 3.04197),
                        initialZoom: 5,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.a2sdz.crm',
                        ),
                        MarkerLayer(
                          markers: current?.pharmacies
                                  ?.where((element) => (element.pharmacy?.latitude != null &&
                                      element.pharmacy?.longitude != null))
                                  .map((e) {
                                return Marker(
                                  width: 50.sp,
                                  height: 50.sp,
                                  point:
                                      LatLng(e.pharmacy!.latitude ?? 0, e.pharmacy!.longitude ?? 0),
                                  child: InkWell(
                                    onTap: () async {
                                      final availableMaps = await MapLauncher.installedMaps;
                                      await availableMaps.first.showMarker(
                                        coords: Coords(
                                            e.pharmacy!.latitude ?? 0, e.pharmacy!.longitude ?? 0),
                                        title: e.pharmacy!.fullName,
                                      );
                                    },
                                    child: Container(
                                      width: 50.sp,
                                      height: 50.sp,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kCardinal,
                                      ),
                                      child: ProfileCard(
                                        backgroundColor: kCardinal,
                                        text: e.pharmacy!.fullName,
                                        textStyle:
                                            context.textTheme.bodySmall!.copyWith(color: kWhite),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList() ??
                              [],
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
