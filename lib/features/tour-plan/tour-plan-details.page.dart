import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/tour-plan/core/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';

import '../../shared/services/helpers/location.helper.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import '../visits/create-visit.page.dart';
import 'models/tour.dart';
import 'widget/tour.status.widget.dart';

class TourPlanDetailPage extends StatelessWidget {
  final Tour tour;
  const TourPlanDetailPage({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            size: kSpacingX7,
            color: kWhite,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(context.i10n.tourDetailsTitle,
            style: context.textTheme.headlineMedium!.copyWith(color: kWhite)),
      ),
      body: BlocListener<TourPlanBloc, TourPlanState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            failure: (message) {
              context.errorSnackBar(message);
            },
          );
        },
        child: Container(
          constraints: BoxConstraints(
            maxHeight:
                context.height - context.appBarSize - context.paddingBottom,
            minHeight:
                context.height - context.appBarSize - context.paddingBottom,
            maxWidth: context.width,
            minWidth: context.width,
          ),
          child: Stack(
            children: [
              Container(
                height: 40.sp,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom:
                        Radius.elliptical(context.width * 2, context.width / 3),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 60.sp,
                    height: 60.sp,
                    padding: EdgeInsets.all(kPaddingSm3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kBgGrayVisibility2,
                      borderRadius: BorderRadius.circular(kSpacingX4),
                    ),
                    child: Icon(Icons.bolt,
                        size: kSpacingX9, color: kBgGrayVisibility6),
                  ),
                  SizedBox(height: kSpacingX5),
                  Text(
                    context.i10n.tourDetailsTourBy,
                    style: context.textTheme.bodyMedium,
                  ),
                  SizedBox(height: kSpacingX1),
                  Text(
                    tour.delegate.fullName,
                    style: context.textTheme.displaySmall,
                  ),
                  SizedBox(height: kSpacingX3),
                  Center(child: TourStatusCard(flag: tour.statusFlag)),
                  if (tour.statusFlag == 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: kPaddingMd1,
                        horizontal: kPaddingMd2,
                      ),
                      child: CustomButton(
                        text: context.i10n.start,
                        onPressed: () {
                          BlocProvider.of<TourPlanBloc>(context).add(
                            TourPlanEvent.startTour(tourId: tour.tourneeId),
                          );
                        },
                      ),
                    ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kPaddingSm3,
                      horizontal: kPaddingMd2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.i10n.createdAt,
                          style: context.textTheme.headlineSmall,
                        ),
                        Text(
                          tour.startDate,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kPaddingSm3,
                      horizontal: kPaddingMd2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.i10n.tourDetailsRegion,
                          style: context.textTheme.headlineSmall,
                        ),
                        Text(
                          tour.regionName,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kPaddingSm3,
                      horizontal: kPaddingMd2,
                    ),
                    child: TourClientsStatusCard(
                      flag: tour.statusFlag,
                      visitedClients: tour.visitedClients ?? 0,
                      totalClients: tour.totalClients ?? 0,
                    ),
                  ),
                  const Divider(),
                  TourClientsTab(
                    flag: tour.statusFlag,
                    tour: tour,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TourClientsStatusCard extends StatelessWidget {
  final int flag;
  final int visitedClients;
  final int totalClients;
  const TourClientsStatusCard({
    super.key,
    required this.flag,
    required this.visitedClients,
    required this.totalClients,
  });

  @override
  Widget build(BuildContext context) {
    switch (flag) {
      case (0):
      case (2):
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.i10n.tourDetailsClients,
              style: context.textTheme.headlineSmall,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (flag == 0)
                  Icon(
                    Icons.access_time_filled_rounded,
                    color: kBgGrayVisibility4,
                  ),
                if (flag == 2)
                  Icon(
                    Icons.done_all_rounded,
                    color: kSuccessColor,
                  ),
                Text(
                  "$totalClients",
                  style: context.textTheme.headlineSmall,
                )
              ],
            )
          ],
        );
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    context.i10n.tourDetailsVisitedClients,
                    style: context.textTheme.headlineSmall,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.done_all_rounded,
                        color: kSuccessColor,
                      ),
                      Text(
                        "$visitedClients",
                        style: context.textTheme.headlineSmall,
                      )
                    ],
                  )
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                children: [
                  Text(
                    context.i10n.tourDetailsNonVisitedClients,
                    style: context.textTheme.headlineSmall,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time_filled_rounded,
                        color: kBgGrayVisibility4,
                      ),
                      Text(
                        "${(totalClients - visitedClients).abs()}",
                        style: context.textTheme.headlineSmall,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        );
    }
  }
}

class TourClientsTab extends StatefulWidget {
  final int flag;
  final Tour tour;
  const TourClientsTab({super.key, required this.tour, required this.flag});

  @override
  State<TourClientsTab> createState() => _TourClientsTabState();
}

class _TourClientsTabState extends State<TourClientsTab>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            controller: controller,
            tabs: [
              Tab(
                text: context.i10n.tourDetailsAllClients,
              ),
              Tab(
                text: context.i10n.tourDetailsVisitedClients,
              ),
              Tab(
                text: context.i10n.tourDetailsNonVisitedClients,
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                TourClientsList(flag: StatuFlags.all.value, tour: widget.tour),
                TourClientsList(
                  flag: StatuFlags.opened.value,
                  tour: widget.tour,
                ),
                TourClientsList(
                  flag: StatuFlags.pending.value,
                  tour: widget.tour,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TourClientsList extends StatelessWidget {
  final int flag;
  final Tour tour;
  const TourClientsList({super.key, required this.tour, required this.flag});

  @override
  Widget build(BuildContext context) {
    List<TourDetail> pharmacies = [];
    if (flag != StatuFlags.all.value) {
      pharmacies = tour.pharmacies
              ?.where((element) => element.statusFlag == flag)
              .toList() ??
          [];
    } else {
      pharmacies = tour.pharmacies ?? [];
    }
    return ListView.builder(
      itemCount: pharmacies.length,
      itemBuilder: (context, index) {
        final pharmacy = pharmacies[index];
        return GestureDetector(
          onTap: () {
            // if (flag == StatuFlags.pending.value) {
            // TODO: Navigate to client details
            context.push(CreateVisitPage(
              tour: tour,
            ));
            // }
          },
          child: ListTile(
            leading: Container(
              width: 48.sp,
              height: 48.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBgGrayVisibility1,
                border: Border.all(
                  color: kBorder3,
                ),
              ),
              alignment: Alignment.center,
              child: Text(pharmacy.pharmacy?.fullName[0] ?? "",
                  style: context.textTheme.headlineSmall!.copyWith(
                    color: kPrimaryColor,
                  )),
            ),
            title: Text(pharmacy.pharmacy!.fullName),
            subtitle: pharmacy.pharmacy?.latitude != null &&
                    pharmacy.pharmacy?.longitude != null
                ? FutureBuilder(
                    future: LocationHelper.addressFromLongitudeLatitude(
                      latitude: pharmacy.pharmacy?.latitude ?? 0,
                      longitude: pharmacy.pharmacy?.latitude ?? 0,
                    ),
                    builder: (context, snapshot) {
                      return Text(snapshot.data ?? "");
                    })
                : Text(context.i10n.tourCreationNoAddress),
            trailing: pharmacy.statusFlag != StatuFlags.pending.value
                ? Icon(
                    Icons.done_all_rounded,
                    color: kSuccessColor,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_rounded,
                        color: flag == StatuFlags.opened.value
                            ? kPrimaryColor
                            : kText5,
                      ),
                      Text(
                        context.i10n.tourDetailsVisitClient,
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: flag == StatuFlags.opened.value
                              ? kPrimaryColor
                              : kText5,
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
