import 'package:crm/features/clients/blocs/claims/claim_cubit.dart';
import 'package:crm/features/clients/blocs/details/client_details_cubit.dart';
import 'package:crm/features/clients/blocs/observation/observation_cubit.dart';
import 'package:crm/features/clients/pages/create-claim.dart';
import 'package:crm/models/person/person.dart';
import 'package:crm/shared/utils/money.formatter.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/core.dart';
import '../../shared/services/helpers/location.helper.dart';
import '../../shared/widgets/buttons/circlebutton.text.widget.dart';
import '../../shared/widgets/image/svg.dart';
import 'pages/create-observation.dart';
import 'widgets/pie_chart.dart';

class ClientDetailsPage extends StatelessWidget {
  final Person client;

  const ClientDetailsPage({super.key, required this.client});

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
        title: Text(
          context.i10n.clientDetails,
          style: context.textTheme.headlineMedium!.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
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
                height: 40.sp,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(context.width * 2, context.width / 3),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kPaddingMd2,
                  vertical: kPaddingSm3,
                ),
                child: Column(
                  children: [
                    ProfileCard(
                      size: 60,
                      text: client.fullName,
                    ),
                    SizedBox(height: kSpacingX5),
                    Center(
                      child: Text(
                        client.fullName,
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: kSpacingX5),
                    if (client.latitude != null && client.longitude != null)
                      Center(
                        child: InkWell(
                          onTap: () async {
                            final availableMaps = await MapLauncher.installedMaps;
                            await availableMaps.first.showMarker(
                              coords: Coords(client.latitude ?? 0, client.longitude ?? 0),
                              title: client.fullName,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: FutureBuilder(
                                  future: LocationHelper.addressFromLongitudeLatitude(
                                    latitude: client.latitude ?? 0,
                                    longitude: client.longitude ?? 0,
                                  ),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "",
                                      textAlign: TextAlign.center,
                                      style: context.textTheme.headlineMedium,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: kSpacingX1),
                              Icon(
                                Icons.location_on_rounded,
                                color: kPrimaryColor,
                                size: kSpacingX5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (client.latitude == null && client.longitude == null)
                      Center(
                        child: Text(
                          context.i10n.noAddress,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    SizedBox(height: kSpacingX3),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: kPaddingSm3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              final Uri phoneLaunchUri = Uri.parse(
                                  'tel://${client.telMobile ?? client.tel1Fixe ?? client.tel2Fixe ?? ""}');

                              if (client.tel1Fixe != null ||
                                  client.tel2Fixe != null ||
                                  client.telMobile != null) {
                                await launchUrl(phoneLaunchUri);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(kPaddingSm3),
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(kRadiusRounded),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone_rounded,
                                    size: kSpacingX6,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: kSpacingX2),
                                  Text(
                                    client.telMobile ??
                                        client.tel1Fixe ??
                                        client.tel2Fixe ??
                                        context.i10n.noPhone,
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: kSpacingX3),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: kPaddingSm3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              final Uri emailLaunchUri = Uri.parse(
                                  'mailto:${client.email ?? ""}?subject=${'A2S IS THE BEST'}');

                              if (client.email != null) {
                                await launchUrl(emailLaunchUri);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(kPaddingSm3),
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(kRadiusRounded),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email_rounded,
                                    size: kSpacingX6,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: kSpacingX2),
                                  Text(
                                    client.email != null && client.email!.isNotEmpty
                                        ? client.email!
                                        : context.i10n.noEmail,
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: kSpacingX3),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        Expanded(
                          child: CircleButtonText(
                            icon: Icons.note_alt_rounded,
                            text: context.i10n.addObservation,
                            onPressed: () {
                              context.push(CreateObservationPage(
                                pharmacyId: client.id,
                              ));
                            },
                          ),
                        ),
                        Expanded(
                          child: CircleButtonText(
                            icon: Icons.warning_rounded,
                            text: context.i10n.addClaim,
                            color: kBrightSun,
                            onPressed: () {
                              context.push(CreateClaimPage(
                                pharmacyId: client.id,
                              ));
                            },
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                      ],
                    ),
                    SizedBox(height: kSpacingX3),
                    const Expanded(child: ClientOptionsTab())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClientOptionsTab extends StatefulWidget {
  const ClientOptionsTab({super.key});

  @override
  State<ClientOptionsTab> createState() => _ClientOptionsTabState();
}

class _ClientOptionsTabState extends State<ClientOptionsTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kRadiusRounded),
            color: kCodGray.shade100,
          ),
          child: TabBar(
            controller: _tabController,
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            unselectedLabelColor: kCodGray,
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              Tab(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: context.width / 3,
                    minWidth: context.width / 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.analytics),
                      SizedBox(width: kSpacingX1),
                      Text(context.i10n.analytics),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: context.width / 3,
                    minWidth: context.width / 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.remove_red_eye_rounded),
                      SizedBox(width: kSpacingX1),
                      Text(context.i10n.observations),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: context.width / 3,
                    minWidth: context.width / 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.assignment_rounded),
                      SizedBox(width: kSpacingX1),
                      Text(context.i10n.claims),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kSpacingX3),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            BlocBuilder<ClientDetailsCubit, ClientDetailsState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () {
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
                            context.i10n.noAnalytics,
                            style: context.textTheme.headlineMedium,
                          ),
                          SizedBox(height: kSpacingX2),
                          Text(
                            context.i10n.noAnalyticsDesc,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ));
                    },
                    loading: () => const Center(child: Loader()),
                    loaded: (statistics) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  context.i10n.ceiling,
                                  style: context.textTheme.headlineMedium,
                                ),
                                Expanded(
                                  child: Text(
                                    MoneyHelper.format(context, statistics.ceiling.toDouble()),
                                    textAlign: TextAlign.end,
                                    style: context.textTheme.headlineMedium!.copyWith(
                                      fontSize: 25.h,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(height: kSpacingX3),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  context.i10n.totalHt,
                                  style: context.textTheme.headlineMedium,
                                ),
                                Expanded(
                                  child: Text(
                                    MoneyHelper.format(context, statistics.totalHt.toDouble()),
                                    textAlign: TextAlign.end,
                                    style: context.textTheme.headlineMedium!.copyWith(
                                      fontSize: 25.h,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(height: kSpacingX3),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  context.i10n.totalTtc,
                                  style: context.textTheme.headlineMedium,
                                ),
                                Expanded(
                                  child: Text(
                                    MoneyHelper.format(context, statistics.totalTtc.toDouble()),
                                    textAlign: TextAlign.end,
                                    style: context.textTheme.headlineMedium!.copyWith(
                                      fontSize: 25.h,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(height: kSpacingX3),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  context.i10n.totalPayment,
                                  style: context.textTheme.headlineMedium,
                                ),
                                Expanded(
                                  child: Text(
                                    MoneyHelper.format(context, statistics.totalPayment.toDouble()),
                                    textAlign: TextAlign.end,
                                    style: context.textTheme.headlineMedium!.copyWith(
                                      fontSize: 25.h,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(height: kSpacingX3),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  context.i10n.totalRest,
                                  style: context.textTheme.headlineMedium,
                                ),
                                Expanded(
                                  child: Text(
                                    MoneyHelper.format(context, statistics.totalRest.toDouble()),
                                    textAlign: TextAlign.end,
                                    style: context.textTheme.headlineMedium!.copyWith(
                                      fontSize: 25.h,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(height: kSpacingX3),
                            PieChartSample3(
                              reclamations: statistics.clientReclamations,
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
            BlocBuilder<ObservationCubit, ObservationState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () {
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
                            context.i10n.noObservations,
                            style: context.textTheme.headlineMedium,
                          ),
                          SizedBox(height: kSpacingX2),
                          Text(
                            context.i10n.noObservationsDesc,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ));
                    },
                    loading: () => const Center(child: Loader()),
                    loaded: (observations) {
                      if (observations.isEmpty) {
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
                              context.i10n.noObservations,
                              style: context.textTheme.headlineMedium,
                            ),
                            SizedBox(height: kSpacingX2),
                            Text(
                              context.i10n.noObservationsDesc,
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ));
                      }
                      return ListView.builder(
                        itemCount: observations.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    observations[index].title,
                                    style: context.textTheme.headlineMedium,
                                  ),
                                ),
                                SizedBox(width: kSpacingX1),
                                Text(
                                  observations[index].date,
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              observations[index].reportText,
                              softWrap: true,
                              maxLines: 3,
                              style: context.textTheme.bodyMedium,
                            ),
                          );
                        },
                      );
                    });
              },
            ),
            BlocBuilder<ClaimCubit, ClaimState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () {
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
                            context.i10n.noClaims,
                            style: context.textTheme.headlineMedium,
                          ),
                          SizedBox(height: kSpacingX2),
                          Text(
                            context.i10n.noClaimsDesc,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ));
                    },
                    loading: () => const Center(child: Loader()),
                    loaded: (claims) {
                      if (claims.isEmpty) {
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
                              context.i10n.noClaims,
                              style: context.textTheme.headlineMedium,
                            ),
                            SizedBox(height: kSpacingX2),
                            Text(
                              context.i10n.noClaimsDesc,
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ));
                      }
                      return ListView.builder(
                        itemCount: claims.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    claims[index].motif,
                                    style: context.textTheme.headlineMedium,
                                  ),
                                ),
                                SizedBox(width: kSpacingX1),
                                Text(
                                  claims[index].date,
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              claims[index].rapportText,
                              softWrap: true,
                              maxLines: 3,
                              style: context.textTheme.bodyMedium,
                            ),
                          );
                        },
                      );
                    });
              },
            ),
          ]),
        ),
      ],
    );
  }
}
