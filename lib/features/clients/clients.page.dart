import 'dart:developer';

import 'package:crm/core/core.dart';
import 'package:crm/features/clients/blocs/claims/claim_cubit.dart';
import 'package:crm/features/clients/blocs/details/client_details_cubit.dart';
import 'package:crm/features/clients/blocs/grossiste/grossiste_cubit.dart';
import 'package:crm/features/clients/blocs/observation/observation_cubit.dart';
import 'package:crm/features/clients/blocs/turnover/turnover_cubit.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/inputs/dropdown.input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/person/person.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';
import '../../logic/search/search_cubit.dart';
import '../tour-plan/bloc/clients/clients_cubit.dart';
import '../tour-plan/bloc/commune_cubit.dart';
import '../tour-plan/bloc/wilaya_cubit.dart';
import '../tour-plan/models/commune/commune.dart';
import '../tour-plan/models/wilaya/wilaya.dart';
import 'blocs/etablissement/etablissement_cubit.dart';
import 'client-details.page.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  String selectedWilaya = '';
  String selectedCommune = '';
  String selectedClientType = '';
  String _searchQuery = '';

  bool? get _prospectFilter {
    if (selectedClientType == 'prospect') return true;
    if (selectedClientType == 'client') return false;
    return null;
  }

  void _applyFilter() {
    context.read<ClientsCubit>().filter(
          searchQuery: _searchQuery,
          commune: selectedCommune,
          regionId: selectedWilaya,
          prospect: _prospectFilter,
        );
  }

  @override
  void initState() {
    super.initState();
    // Reset search and filters when entering the page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>().reset();
      setState(() {
        selectedWilaya = '';
        selectedCommune = '';
        selectedClientType = '';
        _searchQuery = '';
      });
      context.read<ClientsCubit>().filter();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, String>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, query) {
        setState(() {
          _searchQuery = query;
        });
        _applyFilter();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.i10n.clients),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: Column(
                children: [
                  SearchTextField(
                    hintText: context.i10n.clientName,
                    onChanged: (query) {
                      setState(() {
                        _searchQuery = query;
                      });
                      _applyFilter();
                    },
                  ),
                  SizedBox(height: kSpacingX2),
                  BlocBuilder<WilayaCubit, List<Wilaya>>(
                    builder: (context, wilayas) {
                      return CustomDropDownInput(
                        mapKey: 'regionId',
                        onChanged: (value) {
                          setState(() {
                            selectedWilaya = value ?? "";
                            selectedCommune = ""; // Reset commune
                            _applyFilter();
                          });
                        },
                        items: [
                          CustomDropDownItem(
                            label: context.i10n.allRegions,
                            value: "",
                          ),
                          ...wilayas.map(
                            (wilaya) => CustomDropDownItem(
                              label: wilaya.name,
                              value: wilaya.code.toString(),
                            ),
                          ),
                        ],
                        data: {},
                      );
                    },
                  ),
                  SizedBox(height: kSpacingX2),
                  BlocBuilder<CommuneCubit, List<Commune>>(
                    builder: (context, communes) {
                      return CustomDropDownInput(
                        mapKey: 'communeId',
                        onChanged: (value) {
                          setState(() {
                            selectedCommune = value ?? "";
                            _applyFilter();
                          });
                        },
                        items: [
                          CustomDropDownItem(
                            label: context.i10n.allCommunes,
                            value: "",
                          ),
                          ...communes.where((commune) {
                            if (selectedWilaya.isEmpty) return true;
                            return commune.wlyCode == selectedWilaya;
                          }).map(
                            (commune) => CustomDropDownItem(
                              label: commune.name,
                              value: commune.name,
                            ),
                          ),
                        ],
                        data: {},
                      );
                    },
                  ),
                  SizedBox(height: kSpacingX2),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // All Clients Radio Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedClientType = "";
                              _applyFilter();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: selectedClientType.isEmpty
                                  ? kPrimaryColor.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: selectedClientType.isEmpty
                                    ? kPrimaryColor
                                    : Colors.grey,
                              ),
                            ),
                            child: Row(
                              children: [
                                Radio<String?>(
                                  value: null,
                                  groupValue: selectedClientType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedClientType = value ?? "";
                                      _applyFilter();
                                    });
                                  },
                                ),
                                Text(context.i10n.allClients,
                                    style: context.textTheme.bodyMedium),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: kSpacingX2),
                        // Prospect Radio Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedClientType = "prospect";
                              _applyFilter();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: selectedClientType == "prospect"
                                  ? kPrimaryColor.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: selectedClientType == "prospect"
                                    ? kPrimaryColor
                                    : Colors.grey,
                              ),
                            ),
                            child: Row(
                              children: [
                                Radio<String?>(
                                  value: "prospect",
                                  groupValue: selectedClientType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedClientType = value ?? "";
                                      _applyFilter();
                                    });
                                  },
                                ),
                                Text(context.i10n.prospect,
                                    style: context.textTheme.bodyMedium),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: kSpacingX2),
                        // Client Radio Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedClientType = "client";
                              _applyFilter();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: selectedClientType == "client"
                                  ? kPrimaryColor.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: selectedClientType == "client"
                                    ? kPrimaryColor
                                    : Colors.grey,
                              ),
                            ),
                            child: Row(
                              children: [
                                Radio<String?>(
                                  value: "client",
                                  groupValue: selectedClientType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedClientType = value ?? "";
                                      _applyFilter();
                                    });
                                  },
                                ),
                                Text(context.i10n.client,
                                    style: context.textTheme.bodyMedium),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ClientsCubit, ClientsState>(
                builder: (context, clientState) {
                  return clientState.maybeWhen(
                    orElse: () => Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.i10n.noClientsFound),
                        SizedBox(height: kSpacingX2),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ClientsCubit>().load();
                          },
                          child: Text(context.i10n.retry,
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: Colors.white)),
                        ),
                      ],
                    )),
                    loaded: (allClients, filteredClients) {
                      log('Total clients: ${allClients.length}, Filtered clients: ${filteredClients.length}');
                      final clients = filteredClients;

                      if (clients.isEmpty) {
                        return Center(child: Text(context.i10n.noClientsFound));
                      }

                      return ListView.builder(
                        itemCount: clients.length,
                        itemBuilder: (context, index) {
                          final client = clients[index];
                          return ClientCard(client: client);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClientCard extends StatelessWidget {
  final Person client;
  final bool showDetails;
  final void Function()? onPressed;

  const ClientCard({
    super.key,
    required this.client,
    this.showDetails = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    void loadClientData(BuildContext context, int clientId) {
      final cubits = [
        context.read<TurnoverCubit>(),
        context.read<ObservationCubit>(),
        context.read<ClaimCubit>(),
        context.read<GrossisteCubit>(),
        context.read<EtablissementCubit>(),
        context.read<ClientDetailsCubit>(),
      ];

      for (var cubit in cubits) {
        if (cubit is TurnoverCubit) {
          cubit.fetchTurnovers(clientId);
        } else if (cubit is ObservationCubit) {
          cubit.get(pharmacyId: clientId);
        } else if (cubit is ClaimCubit) {
          cubit.get(pharmacyId: clientId);
        } else if (cubit is GrossisteCubit) {
          cubit.get(pharmacyId: clientId);
        } else if (cubit is EtablissementCubit) {
          cubit.get(pharmacyId: clientId);
        } else if (cubit is ClientDetailsCubit) {
          cubit.load(clientId: clientId);
        }
      }
    }

    return ListTile(
      onTap: () {
        onPressed?.call();
        if (!showDetails) return;

        loadClientData(context, client.id);

        context.push(
          ClientDetailsPage(client: client),
        );
      },
      leading: ProfileCard(
        text: client.fullName,
        borderColor: client.prospect ?? false ? kCardinal : kCeruleanBlue,
      ),
      title: Text(client.fullName, style: context.textTheme.bodyLarge),
      subtitle: Text(client.address ?? context.i10n.noAddress,
          style: context.textTheme.bodyMedium),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
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
              if (client.latitude == null || client.longitude == null) {
                return;
              }
              final availableMaps = await MapLauncher.installedMaps;
              await availableMaps.first.showMarker(
                coords: Coords(client.latitude!, client.longitude!),
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
        ],
      ),
    );
  }
}
