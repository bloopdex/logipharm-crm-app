import 'package:crm/core/core.dart';
import 'package:crm/shared/services/helpers/location.helper.dart';
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
import '../models/wilaya/wilaya.dart';

class AddClientsForm extends StatelessWidget {
  final Map<String, dynamic> data;
  const AddClientsForm({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
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
                      data: data,
                      mapKey: 'regionId',
                      onChanged: (value) => context.read<ClientsCubit>().filter(value ?? ""),
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
                loaded: (clients) {
                  final filtered = clients
                      .where(
                        (e) => e.supervisor == int.tryParse(data['delegueId']),
                      )
                      .toList();
                  if (filtered.isEmpty) {
                    return const ClientCardEmpty();
                  }
                  return BlocBuilder<SelectionCubit, SelectionState>(
                    builder: (context, selection) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => ClientCard(
                          client: filtered[index],
                          data: data,
                          checked: selection.selected.contains(
                            filtered[index].id.toString(),
                          ),
                        ),
                        itemCount: clients.length,
                      );
                    },
                  );
                },
              ),
            ));
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
          height: 175.sp,
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
          width: 48.sp,
          height: 48.sp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kBgGrayVisibility1,
          ),
        ),
        title: Container(
          width: 20.sp,
          height: 22.sp,
          color: kBgGrayVisibility1,
        ),
        subtitle: Container(
          width: 297.sp,
          height: 22.sp,
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
        secondary: Container(
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
          child: Text(
            client.fullName.initials,
          ),
        ),
        title: Text(client.fullName),
        subtitle: client.latitude != null && client.longitude != null
            ? FutureBuilder(
                future: LocationHelper.addressFromLongitudeLatitude(
                  latitude: client.latitude ?? 0,
                  longitude: client.longitude ?? 0,
                ),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "");
                })
            : Text(context.i10n.tourCreationNoAddress),
        tileColor: checked ? kCeruleanBlue.shade100 : null,
        value: checked,
        onChanged: (value) {
          context.read<SelectionCubit>().select(client.id.toString());
          data['pharmacieIds'] = context.read<SelectionCubit>().state.selected;
        });
  }
}
