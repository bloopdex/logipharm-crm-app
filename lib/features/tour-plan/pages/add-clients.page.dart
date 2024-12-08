import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/bloc/commune_cubit.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../logic/selection_cubit.dart';
import '../../../models/person/person.dart';
import '../../../shared/widgets/image/svg.dart';
import '../../../shared/widgets/inputs/dropdown.input.dart';
import '../bloc/clients/clients_cubit.dart';
import '../bloc/wilaya_cubit.dart';
import '../models/commune/commune.dart';
import '../models/wilaya/wilaya.dart';

class AddClientsForm extends StatefulWidget {
  final Map<String, dynamic> data;

  const AddClientsForm({super.key, required this.data});

  @override
  State<AddClientsForm> createState() => _AddClientsFormState();
}

class _AddClientsFormState extends State<AddClientsForm> {
  String? regionId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.i10n.tourCreationClientVisitsTitle,
                style: context.textTheme.displayMedium,
              ),
              SizedBox(height: kSpacingX3),
              Text(
                context.i10n.tourCreationClientVisitsDescription,
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(height: kSpacingX7),
              Text(
                context.i10n.tourCreationRegionLabel,
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(height: kSpacingX1),
              BlocBuilder<WilayaCubit, List<Wilaya>>(
                builder: (context, state) {
                  return CustomDropDownInput(
                      data: widget.data,
                      mapKey: 'regionId',
                      onChanged: (value) {
                        context.read<ClientsCubit>().filter(regionId: value ?? "");

                        setState(() {
                          regionId = value;
                        });
                      },
                      items: [
                        CustomDropDownItem(
                          label: context.i10n.allRegions,
                          value: "",
                        ),
                        ...state.map(
                          (e) => CustomDropDownItem(
                            label: e.name,
                            value: e.code.toString(),
                          ),
                        )
                      ]);
                },
              ),
              SizedBox(height: kSpacingX2),
              BlocBuilder<CommuneCubit, List<Commune>>(
                builder: (context, state) {
                  return CustomDropDownInput(
                      data: widget.data,
                      mapKey: 'communeId',
                      onChanged: (value) => context.read<ClientsCubit>().filter(
                            regionId: widget.data['regionId'] ?? "",
                            commune: value ?? "",
                          ),
                      items: [
                        CustomDropDownItem(
                          label: context.i10n.allCommunes,
                          value: "",
                        ),
                        ...state.where((e) {
                          if (regionId == null) {
                            return true;
                          }
                          return e.wlyCode == regionId;
                        }).map(
                          (e) => CustomDropDownItem(
                            label: e.name,
                            value: e.name,
                          ),
                        )
                      ]);
                },
              ),
              SizedBox(height: kSpacingX5),
              Text(
                context.i10n.tourCreationClientsLabel,
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(height: kSpacingX1),
            ],
          ),
        ),
        BlocBuilder<ClientsCubit, ClientsState>(
          builder: (context, clientState) {
            return Expanded(
              child: Container(
                child: clientState.maybeWhen(
                  orElse: () => ListView.separated(
                    itemBuilder: (context, index) => const ClientCardShimmer(),
                    separatorBuilder: (context, index) => SizedBox(height: kSpacingX4),
                    itemCount: 6,
                  ),
                  loaded: (all, filter) {
                    final filtered = filter
                        .where(
                          (e) => e.supervisor == int.tryParse(widget.data['delegueId']),
                        )
                        .toList();
                    if (filtered.isEmpty) {
                      return const SingleChildScrollView(child: ClientCardEmpty());
                    }
                    return BlocBuilder<SelectionCubit, SelectionState>(
                      builder: (context, selection) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ClientCard(
                            client: filtered[index],
                            data: widget.data,
                            checked: selection.selected.contains(
                              '${filtered[index].id.toString()}:${filtered[index].typeTier}',
                            ),
                          ),
                          itemCount: filtered.length,
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ClientCardEmpty extends StatelessWidget {
  const ClientCardEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          context.i10n.tourCreationClientEmptyTitle,
          style: context.textTheme.headlineMedium,
        ),
        SizedBox(height: kSpacingX2),
        Text(
          context.i10n.tourCreationClientEmptyDescription,
          style: context.textTheme.bodyMedium,
        ),
      ],
    ));
  }
}

class ClientCardShimmer extends StatelessWidget {
  const ClientCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kBgGrayVisibility1,
      highlightColor: kBgGrayVisibility2,
      child: ListTile(
        leading: Container(
          width: 48.h,
          height: 48.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kBgGrayVisibility1,
          ),
        ),
        title: Container(
          width: 20.h,
          height: 22.h,
          color: kBgGrayVisibility1,
        ),
        subtitle: Container(
          width: 297.h,
          height: 22.h,
          color: kBgGrayVisibility1,
        ),
      ),
    );
  }
}

class ClientCard extends StatelessWidget {
  final Person client;
  final bool checked;
  final Map<String, dynamic> data;

  const ClientCard({
    super.key,
    required this.client,
    required this.checked,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        secondary: ProfileCard(
          size: 48.h,
          text: client.fullName,
          borderColor: client.prospect ?? false ? kCardinal : kCeruleanBlue,
        ),
        title: Text(client.fullName),
        subtitle: Text(
          client.address ?? context.i10n.noAddress,
          softWrap: true,
          maxLines: 2,
        ),
        tileColor: checked ? kCeruleanBlue.shade100 : null,
        value: checked,
        onChanged: (value) {
          context.read<SelectionCubit>().select('${client.id.toString()}:${client.typeTier}');
          data['pharmacieIds'] = context.read<SelectionCubit>().state.selected;
        });
  }
}
