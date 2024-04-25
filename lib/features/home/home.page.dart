import 'package:crm/features/tour-plan/bloc/clients/clients_cubit.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../core/core.dart';
import '../../shared/widgets/buttons/circlebutton.text.widget.dart';
import '../hiring/create-hire.page.dart';
import '../todo/create-event.page.dart';
import '../tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import '../tour-plan/core/enums.dart';
import '../tour-plan/create-plan.page.dart';
import '../tour-plan/models/tour.dart';
import '../tour-plan/widget/current.plan.widget.dart';
import '../visits/create-visit.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              final Tour? current = state.maybeWhen(
                loaded: (tours, hasReachedMax, currentPage) {
                  return tours
                      .where((element) =>
                          element.statusFlag == StatuFlags.opened.value)
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.offline_bolt_rounded,
                    text: context.i10n.homeCreateNewPlan,
                    onPressed: () {
                      context.push(const CreatePlanPage());
                    },
                  ),
                ),
                Expanded(
                  child: CircleButtonText(
                    icon: Icons.fact_check_rounded,
                    text: context.i10n.homeCreateNewVisit,
                    onPressed: () {
                      final current =
                          context.read<TourPlanBloc>().state.maybeWhen(
                                loaded: (tours, hasReachedMax, currentPage) {
                                  return tours
                                      .where((element) =>
                                          element.statusFlag ==
                                          StatuFlags.opened.value)
                                      .firstOrNull;
                                },
                                orElse: () => null,
                              );
                      if (current != null &&
                          current.pharmacies != null &&
                          current.pharmacies!.isNotEmpty) {
                        context.push(
                          CreateVisitPage(
                            tour: current,
                            pharmacieId: current.pharmacies!.first.pharmacy!.id
                                .toString(),
                          ),
                        );
                      }
                    },
                    color: context.watch<TourPlanBloc>().state.maybeWhen(
                                  loaded: (tours, hasReachedMax, currentPage) {
                                    return tours
                                        .where((element) =>
                                            element.statusFlag ==
                                            StatuFlags.opened.value)
                                        .firstOrNull;
                                  },
                                  orElse: () => null,
                                ) ==
                            null
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
                child: BlocBuilder<ClientsCubit, ClientsState>(
                  builder: (context, state) {
                    return FlutterMap(
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
                        MarkerLayer(
                            markers: state.maybeWhen(
                          orElse: () => [],
                          loaded: (clients) => clients.map((e) {
                            if (e.latitude == null || e.longitude == null) {
                              return Marker(
                                  point: LatLng(0, 0), child: Container());
                            }
                            return Marker(
                              point: LatLng(e.latitude!, e.longitude!),
                              child: InkWell(
                                onTap: () async {
                                  final availableMaps =
                                      await MapLauncher.installedMaps;
                                  await availableMaps.first.showMarker(
                                    coords: Coords(e.latitude!, e.longitude!),
                                    title: context.i10n.clientAddress,
                                  );
                                },
                                child: ProfileCard(
                                  text: e.fullName,
                                ),
                              ),
                            );
                          }).toList(),
                        )),
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
