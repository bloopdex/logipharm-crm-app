import 'package:crm/core/core.dart';
import 'package:crm/logic/search/search_cubit.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../logic/auth/auth_bloc.dart';
import '../../../logic/selection_cubit.dart';
import '../../../models/person/person.dart';
import '../../../shared/widgets/image/svg.dart';
import '../../../shared/widgets/inputs/dropdown.input.dart';
import '../../../shared/widgets/inputs/search.text.field.widget.dart';
import '../../contacts/bloc/contacts_cubit.dart';
import '../bloc/clients/clients_cubit.dart';
import '../bloc/wilaya_cubit.dart';
import '../models/wilaya/wilaya.dart';

class AddClientsForm extends StatefulWidget {
  final Map<String, dynamic> data;

  const AddClientsForm({super.key, required this.data});

  @override
  State<AddClientsForm> createState() => _AddClientsFormState();
}

class _AddClientsFormState extends State<AddClientsForm> {
  String? regionId;
  String _searchQuery = '';
  String _categoryFilter = '';

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().user;
    final useContacts = user.companyType == 1;
    if (useContacts) {
      final contactsCubit = context.read<ContactsCubit?>();
      if (contactsCubit != null) {
        final shouldLoad = contactsCubit.state.maybeWhen(
            loaded: (contacts) => contacts.isEmpty, orElse: () => true);
        if (shouldLoad) {
          // Pharmacien, Medecin, Patient
          contactsCubit.load(categories: const ['1', '2', '3']);
        }
      }
    }

    return BlocListener<SearchCubit, String>(
      listener: (context, state) {
        _searchQuery = state;
        if (!useContacts) {
          if (state.isNotEmpty) {
            context.read<ClientsCubit>().filter(searchQuery: state);
          }
        } else {
          setState(() {});
        }
      },
      child: Column(
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
                SearchTextField(
                  hintText: context.i10n.clientName,
                ),
                SizedBox(height: kSpacingX2),
                if (!useContacts)
                  BlocBuilder<ClientsCubit, ClientsState>(
                    builder: (context, clientState) {
                      final allClients = clientState.maybeWhen(
                        loaded: (all, _) => all,
                        orElse: () => <Person>[],
                      );
                      final delegateId =
                          int.tryParse(widget.data['delegueId'] ?? '');
                      final delegateClients = delegateId != null
                          ? allClients
                              .where((c) => c.supervisor == delegateId)
                              .toList()
                          : allClients;
                      final clientRegionIds = delegateClients
                          .where((c) =>
                              c.regionId != null && c.regionId!.isNotEmpty)
                          .map((c) => c.regionId!)
                          .toSet();
                      return BlocBuilder<WilayaCubit, List<Wilaya>>(
                        builder: (context, wilayas) {
                          final filteredWilayas = wilayas
                              .where((w) => clientRegionIds.contains(w.code))
                              .toList();
                          return CustomDropDownInput(
                              data: widget.data,
                              mapKey: 'regionId',
                              onChanged: (value) {
                                context
                                    .read<ClientsCubit>()
                                    .filter(regionId: value ?? "");
                                setState(() {
                                  regionId = value;
                                });
                              },
                              items: [
                                CustomDropDownItem(
                                  label: context.i10n.allRegions,
                                  value: "",
                                ),
                                ...filteredWilayas.map(
                                  (e) => CustomDropDownItem(
                                    label: e.name,
                                    value: e.code.toString(),
                                  ),
                                ),
                              ]);
                        },
                      );
                    },
                  ),
                SizedBox(height: kSpacingX2),
                if (!useContacts)
                  BlocBuilder<ClientsCubit, ClientsState>(
                    builder: (context, clientState) {
                      final allClients = clientState.maybeWhen(
                        loaded: (all, _) => all,
                        orElse: () => <Person>[],
                      );
                      final delegateId =
                          int.tryParse(widget.data['delegueId'] ?? '');
                      final delegateClients = delegateId != null
                          ? allClients
                              .where((c) => c.supervisor == delegateId)
                              .toList()
                          : allClients;
                      // Build a map of normalized key → original display name
                      // to handle Unicode variants of the same commune name
                      final villeMap = <String, String>{};
                      for (final c in delegateClients) {
                        if (regionId != null &&
                            regionId!.isNotEmpty &&
                            c.regionId != regionId) {
                          continue;
                        }
                        if (c.ville != null && c.ville!.isNotEmpty) {
                          final key = normalizeForComparison(c.ville!);
                          villeMap.putIfAbsent(key, () => c.ville!);
                        }
                      }
                      final sortedVilles = villeMap.entries.toList()
                        ..sort((a, b) => a.key.compareTo(b.key));
                      return CustomDropDownInput(
                          data: widget.data,
                          mapKey: 'communeId',
                          onChanged: (value) =>
                              context.read<ClientsCubit>().filter(
                                    regionId: widget.data['regionId'] ?? "",
                                    commune: value ?? "",
                                  ),
                          items: [
                            CustomDropDownItem(
                              label: context.i10n.allCommunes,
                              value: "",
                            ),
                            ...sortedVilles.map(
                              (e) => CustomDropDownItem(
                                label: e.value,
                                value: e.key,
                              ),
                            ),
                          ]);
                    },
                  ),
                if (useContacts) ...[
                  SizedBox(height: kSpacingX2),
                  _buildCategoryFilters(context),
                ],
                SizedBox(height: kSpacingX5),
                Text(
                  useContacts
                      ? 'Contacts'
                      : context.i10n.tourCreationClientsLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
              ],
            ),
          ),
          if (!useContacts)
            BlocBuilder<ClientsCubit, ClientsState>(
              builder: (context, clientState) {
                return Expanded(
                  child: Container(
                    child: clientState.maybeWhen(
                      orElse: () => ListView.separated(
                        itemBuilder: (context, index) =>
                            const ClientCardShimmer(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: kSpacingX4),
                        itemCount: 6,
                      ),
                      loaded: (all, filter) {
                        final filtered = filter
                            .where(
                              (e) =>
                                  e.supervisor ==
                                  int.tryParse(widget.data['delegueId']),
                            )
                            .toList();
                        if (filtered.isEmpty) {
                          return const SingleChildScrollView(
                              child: ClientCardEmpty());
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
            )
          else
            BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, contactsState) {
                return Expanded(
                  child: Container(
                    child: contactsState.maybeWhen(
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (m) => Center(child: Text(m)),
                      loaded: (contacts) {
                        final delegateId =
                            int.tryParse(widget.data['delegueId'] ?? '');
                        final filtered = contacts.where((c) {
                          final matchesDelegate =
                              delegateId == null || c.delegueId == delegateId;
                          final q = _searchQuery.toLowerCase();
                          final name = ([c.nom, c.prenom]
                                  .where((e) => (e ?? '').isNotEmpty)
                                  .join(' '))
                              .toLowerCase();
                          final city = (c.ville ?? '').toLowerCase();
                          final matchesQuery =
                              q.isEmpty || name.contains(q) || city.contains(q);
                          final matchesCategory = _categoryFilter.isEmpty ||
                              (c.categorie ?? '') == _categoryFilter;
                          return matchesDelegate &&
                              matchesQuery &&
                              matchesCategory;
                        }).toList();

                        if (filtered.isEmpty) {
                          return const SingleChildScrollView(
                              child: ClientCardEmpty());
                        }

                        return BlocBuilder<SelectionCubit, SelectionState>(
                          builder: (context, selection) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final contact = filtered[index];
                                // For contacts flow, keep legacy format id:typeclient with typeclient forced to 1
                                final key = '${contact.id}:1';
                                final checked =
                                    selection.selected.contains(key);
                                final name = [contact.nom, contact.prenom]
                                    .where((e) => (e ?? '').isNotEmpty)
                                    .join(' ');
                                final cat = contact.categorie ?? '1';
                                final typeLabel = cat == '1'
                                    ? context.i10n.contactsPharmacien
                                    : (cat == '2'
                                        ? context.i10n.contactsMedecin
                                        : context.i10n.contactsPatient);
                                final typeIcon = cat == '1'
                                    ? Icons.local_pharmacy
                                    : (cat == '2'
                                        ? Icons.local_hospital
                                        : Icons.person);
                                return CheckboxListTile(
                                  secondary: ProfileCard(
                                    size: 48.h,
                                    text: name.isNotEmpty
                                        ? name
                                        : (contact.nom ?? '-'),
                                    borderColor: kCeruleanBlue,
                                  ),
                                  title: Text(name.isNotEmpty
                                      ? name
                                      : (contact.nom ?? '-')),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        contact.adresse ??
                                            context.i10n.noAddress,
                                        softWrap: true,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(typeIcon, size: 16),
                                          SizedBox(width: 6),
                                          Text(typeLabel,
                                              style:
                                                  context.textTheme.bodySmall),
                                        ],
                                      ),
                                    ],
                                  ),
                                  tileColor:
                                      checked ? kCeruleanBlue.shade100 : null,
                                  value: checked,
                                  onChanged: (value) {
                                    context.read<SelectionCubit>().select(key);
                                  },
                                );
                              },
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
      ),
    );
  }

  Widget _buildCategoryFilters(BuildContext context) {
    final options = [
      {
        'value': '',
        'label': context.i10n.allClients,
        'icon': Icons.all_inclusive,
      },
      {
        'value': '1',
        'label': context.i10n.contactsPharmacien,
        'icon': Icons.local_pharmacy_outlined,
      },
      {
        'value': '2',
        'label': context.i10n.contactsMedecin,
        'icon': Icons.medical_information_outlined,
      },
      {
        'value': '3',
        'label': context.i10n.contactsPatient,
        'icon': Icons.person_outline,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          final value = option['value'] as String;
          final selected = _categoryFilter == value;
          return Padding(
            padding: EdgeInsets.only(right: kSpacingX1),
            child: ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(option['icon'] as IconData, size: 16),
                  SizedBox(width: kSpacingX1),
                  Text(option['label'] as String),
                ],
              ),
              selectedColor: kCeruleanBlue.withOpacity(0.15),
              selected: selected,
              onSelected: (_) {
                setState(() {
                  _categoryFilter = value;
                });
              },
            ),
          );
        }).toList(),
      ),
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
  final Function(Person)? onSelected;

  const ClientCard({
    super.key,
    required this.client,
    required this.checked,
    required this.data,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        secondary: ProfileCard(
          size: 48.h,
          text: client.fullName,
          borderColor: client.inactifFlag == true
              ? kInactiveClient
              : (client.prospect ?? false ? kCardinal : kCeruleanBlue),
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
          context
              .read<SelectionCubit>()
              .select('${client.id.toString()}:${client.typeTier}');
          data['pharmacieIds'] = context.read<SelectionCubit>().state.selected;
          if (onSelected != null) {
            onSelected!(client);
          }
        });
  }
}
