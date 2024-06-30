import 'package:crm/core/core.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../logic/search/search_cubit.dart';
import '../../models/person/person.dart';
import '../../shared/widgets/image/svg.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';
import '../tour-plan/bloc/clients/clients_cubit.dart';

class AddClientSelection extends StatefulWidget {
  const AddClientSelection({super.key});

  @override
  State<AddClientSelection> createState() => _AddClientSelectionState();
}

class _AddClientSelectionState extends State<AddClientSelection> {
  List<Person> clients = [];

  @override
  void initState() {
    clients = context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => [],
          loaded: (clients) => clients,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.clients,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SearchCubit, String>(
            listener: (context, state) {
              setState(() {
                clients = context.read<ClientsCubit>().state.maybeWhen(
                      orElse: () => [],
                      loaded: (clients) => clients.where((element) {
                        return element.fullName.toLowerCase().contains(state.toLowerCase());
                      }).toList(),
                    );
              });
            },
          ),
        ],
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
            constraints: BoxConstraints(
              minHeight: context.height - context.appBarSize - context.paddingBottom,
              maxHeight: context.height - context.appBarSize - context.paddingBottom,
              minWidth: context.width,
              maxWidth: context.width,
            ),
            child: Column(
              children: [
                SearchTextField(
                  hintText: context.i10n.clientName,
                ),
                SizedBox(height: kSpacingX2),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (clients.isEmpty) {
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
                          ),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<ClientsCubit>().load();
                        },
                        child: ListView.separated(
                          itemCount: clients.length,
                          separatorBuilder: (context, index) => SizedBox(height: kSpacingX3),
                          itemBuilder: (context, index) {
                            return ClientCard(client: clients[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientCard extends StatelessWidget {
  final Person client;
  const ClientCard({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context, client);
      },
      leading: ProfileCard(
        text: client.fullName,
      ),
      title: Text(client.fullName, style: context.textTheme.bodyLarge),
      subtitle: Text(client.address ?? "", style: context.textTheme.bodyMedium),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              final Uri phoneLaunchUri = Uri.parse(
                  'tel://${client.telMobile ?? client.tel1Fixe ?? client.tel2Fixe ?? ""}');

              if (client.tel1Fixe != null || client.tel2Fixe != null || client.telMobile != null) {
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
              if (!context.mounted) return;
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
