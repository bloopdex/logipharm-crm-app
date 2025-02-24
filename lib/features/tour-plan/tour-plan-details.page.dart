import 'package:crm/features/clients/blocs/claims/claim_cubit.dart';
import 'package:crm/features/clients/blocs/observation/observation_cubit.dart';
import 'package:crm/features/clients/client-details.page.dart';
import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/tour-plan/core/enums.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/popup/confirmation.popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/core.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import '../clients/blocs/details/client_details_cubit.dart';
import '../clients/blocs/etablissement/etablissement_cubit.dart';
import '../clients/blocs/grossiste/grossiste_cubit.dart';
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
            context.pop();
          },
        ),
        title: Text(context.i10n.tourDetailsTitle,
            style: context.textTheme.headlineMedium!.copyWith(color: kWhite)),
      ),
      body: BlocListener<TourPlanBloc, TourPlanState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loading: () {},
            failure: (message) {
              context.errorSnackBar(message);
            },
          );
        },
        child: Container(
          constraints: BoxConstraints(
            maxHeight: context.height - context.appBarSize - context.paddingBottom,
            minHeight: context.height - context.appBarSize - context.paddingBottom,
            maxWidth: context.width,
            minWidth: context.width,
          ),
          child: Stack(
            children: [
              Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(context.width * 2, context.width / 3),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 60.h,
                    height: 60.h,
                    padding: EdgeInsets.all(kPaddingSm3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kBgGrayVisibility2,
                      borderRadius: BorderRadius.circular(kSpacingX4),
                    ),
                    child: Icon(Icons.bolt, size: kSpacingX9, color: kBgGrayVisibility6),
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
                          context.read<TourPlanBloc>().add(
                                TourPlanEvent.startTour(tourId: tour.tourId),
                              );
                          context.pop();
                        },
                      ),
                    ),
                  if (tour.statusFlag == 1)
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: kPaddingMd1,
                        horizontal: kPaddingMd2,
                      ),
                      child: CustomButton(
                        text: context.i10n.finish,
                        onPressed: () async {
                          bool finish = await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return ConfirmationPopUp(
                                  icon: Icons.check_rounded,
                                  title: context.i10n.closeTourPlan,
                                  description: context.i10n.closeTourPlanDesc,
                                  confirmText: context.i10n.confirm,
                                  cancelText: context.i10n.cancel,
                                  color: kPrimaryColor,
                                  iconBackground: kCeruleanBlue.shade100,
                                );
                              });
                          if (finish) {
                            context.read<TourPlanBloc>().add(
                                  TourPlanEvent.closeTour(tourId: tour.tourId),
                                );
                            context.pop();
                          }
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
                          tour.startDate ?? '',
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
                          tour.regionName ?? context.i10n.noRegion,
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
                  Container(
                    margin: EdgeInsets.only(right: kSpacingX1),
                    child: Icon(
                      Icons.access_time_filled_rounded,
                      color: kBgGrayVisibility4,
                    ),
                  ),
                if (flag == 2)
                  Container(
                    margin: EdgeInsets.only(right: kSpacingX1),
                    child: Icon(
                      Icons.done_all_rounded,
                      color: kSuccessColor,
                    ),
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
                      Container(
                        margin: EdgeInsets.only(right: kSpacingX1),
                        child: Icon(
                          Icons.done_all_rounded,
                          color: kSuccessColor,
                        ),
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
                      Container(
                        margin: EdgeInsets.only(right: kSpacingX1),
                        child: Icon(
                          Icons.access_time_filled_rounded,
                          color: kBgGrayVisibility4,
                        ),
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

class _TourClientsTabState extends State<TourClientsTab> with TickerProviderStateMixin {
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
    final user = context.user;
    List<TourDetail> pharmacies = [];
    if (flag != StatuFlags.all.value) {
      pharmacies = tour.pharmacies?.where((element) => element.statusFlag == flag).toList() ?? [];
    } else {
      pharmacies = tour.pharmacies ?? [];
    }
    return ListView.builder(
      itemCount: pharmacies.length,
      itemBuilder: (context, index) {
        final pharmacy = pharmacies[index];
        return ListTile(
          onTap: () {
            context.read<ObservationCubit>().get(pharmacyId: pharmacy.pharmacy!.id);
            context.read<ClaimCubit>().get(pharmacyId: pharmacy.pharmacy!.id);
            context.read<GrossisteCubit>().get(pharmacyId: pharmacy.pharmacy!.id);
            context.read<EtablissementCubit>().get(pharmacyId: pharmacy.pharmacy!.id);
            context.read<ClientDetailsCubit>().load(clientId: pharmacy.pharmacy!.id);
            context.push(
              ClientDetailsPage(client: pharmacy.pharmacy!),
            );
          },
          leading: ProfileCard(
            text: pharmacy.pharmacy?.fullName ?? "",
            borderColor: pharmacy.pharmacy?.prospect ?? false ? kCardinal : kCeruleanBlue,
          ),
          title: Text(
            pharmacy.pharmacy?.fullName ?? "",
            maxLines: 3,
            softWrap: true,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: pharmacy.reportText != null ? Text(pharmacy.reportText!) : null,
          trailing: pharmacy.statusFlag != StatuFlags.pending.value
              ? Icon(
                  Icons.done_all_rounded,
                  color: kSuccessColor,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      InkWell(
                        onTap: () async {
                          final Uri _phoneLaunchUri = Uri.parse(
                              'tel://${pharmacy.pharmacy?.tel1Fixe ?? pharmacy.pharmacy?.tel2Fixe ?? pharmacy.pharmacy?.telMobile ?? ""}');

                          if (pharmacy.pharmacy?.tel1Fixe != null ||
                              pharmacy.pharmacy?.tel2Fixe != null ||
                              pharmacy.pharmacy?.telMobile != null) {
                            await launchUrl(_phoneLaunchUri);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(kPaddingSm3),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(kRadiusRounded),
                          ),
                          child: Icon(
                            Icons.phone_rounded,
                            size: kSpacingX4,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      SizedBox(width: kSpacingX2),
                      InkWell(
                        onTap: () async {
                          if (pharmacy.pharmacy?.latitude == null ||
                              pharmacy.pharmacy?.longitude == null) {
                            return;
                          }
                          final availableMaps = await MapLauncher.installedMaps;
                          await availableMaps.first.showMarker(
                            coords:
                                Coords(pharmacy.pharmacy!.latitude!, pharmacy.pharmacy!.longitude!),
                            title: context.i10n.clientAddress,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(kPaddingSm3),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(kRadiusRounded),
                          ),
                          child: Icon(
                            Icons.map_rounded,
                            size: kSpacingX4,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ]),
                    InkWell(
                      onTap: () {
                        if (tour.statusFlag == StatuFlags.opened.value &&
                            tour.delegate.id == user.id.id) {
                          context.push(CreateVisitPage(
                            tour: tour,
                            pharmacieId:
                                '${pharmacy.pharmacy?.id.toString()}:${pharmacy.pharmacy?.typeTier}',
                          ));
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: tour.statusFlag == StatuFlags.opened.value &&
                                    tour.delegate.id == user.id.id
                                ? kPrimaryColor
                                : kText5,
                          ),
                          Text(
                            context.i10n.tourDetailsVisitClient,
                            style: context.textTheme.headlineSmall!.copyWith(
                              color: tour.statusFlag == StatuFlags.opened.value &&
                                      tour.delegate.id == user.id.id
                                  ? kPrimaryColor
                                  : kText5,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
