import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contacts_cubit.dart';
import 'models/contact.dart';
import 'contact_form_page.dart';
import 'contact_details_page.dart';
import '../../shared/widgets/container/profile-container.widget.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';
import '../../shared/widgets/inputs/dropdown.input.dart';

class ContactsListPage extends StatefulWidget {
  static const routeName = '/contacts';
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  final ValueNotifier<Set<String>> _selectedCats =
      ValueNotifier({'1', '2', '3'});

  String _searchQuery = '';
  String _selectedWilaya = '';
  String _selectedCommune = '';

  @override
  void initState() {
    super.initState();
    context
        .read<ContactsCubit>()
        .load(categories: _selectedCats.value.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.contactsTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ContactFormPage()),
          );
          context
              .read<ContactsCubit>()
              .load(categories: _selectedCats.value.toList());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Search and region filters
          Padding(
            padding: EdgeInsets.all(kPaddingMd2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  hintText: context.i10n.searchClient,
                  onChanged: (value) => setState(() {
                    _searchQuery = value.trim();
                  }),
                ),
                SizedBox(height: kSpacingX2),
                BlocBuilder<ContactsCubit, ContactsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loaded: (contacts) {
                        // Build wilaya options from contacts
                        final Map<String, String> wilayaMap = {};
                        for (final c in contacts) {
                          final id = (c.wilayaId ?? '').trim();
                          final label = (c.regionLib ?? '').trim();
                          if (id.isEmpty || label.isEmpty) continue;
                          wilayaMap.putIfAbsent(id, () => label);
                        }

                        // Build commune options from contacts, optionally filtered by selected wilaya
                        final Map<String, String> communeMap = {};
                        for (final c in contacts) {
                          final wilayaMatches = _selectedWilaya.isEmpty
                              ? true
                              : (c.wilayaId ?? '') == _selectedWilaya;
                          if (!wilayaMatches) continue;
                          final id = (c.vilId ?? '').trim();
                          final label = (c.ville ?? '').trim();
                          if (id.isEmpty || label.isEmpty) continue;
                          communeMap.putIfAbsent(id, () => label);
                        }

                        final wilayaItems = <CustomDropDownItem>[
                          CustomDropDownItem(
                            label: context.i10n.allRegions,
                            value: '',
                          ),
                          ...wilayaMap.entries.map(
                            (e) => CustomDropDownItem(
                              label: e.value,
                              value: e.key,
                            ),
                          )
                        ];

                        final communeItems = <CustomDropDownItem>[
                          CustomDropDownItem(
                            label: context.i10n.allCommunes,
                            value: '',
                          ),
                          ...communeMap.entries.map(
                            (e) => CustomDropDownItem(
                              label: e.value,
                              value: e.key,
                            ),
                          )
                        ];

                        return Row(
                          children: [
                            Expanded(
                              child: CustomDropDownInput(
                                data: const {},
                                mapKey: 'wilayaId',
                                initialValue: _selectedWilaya,
                                items: wilayaItems,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedWilaya = val ?? '';
                                    _selectedCommune = '';
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: kSpacingX2),
                            Expanded(
                              child: CustomDropDownInput(
                                data: const {},
                                mapKey: 'vilId',
                                initialValue: _selectedCommune,
                                items: communeItems,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedCommune = val ?? '';
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
            child: BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                int pharmCount = 0, medCount = 0, patientCount = 0;
                state.maybeWhen(
                  loaded: (contacts) {
                    for (final c in contacts) {
                      switch (c.categorie) {
                        case '1':
                          pharmCount++;
                          break;
                        case '2':
                          medCount++;
                          break;
                        case '3':
                          patientCount++;
                          break;
                      }
                    }
                  },
                  orElse: () {},
                );

                Widget chip({
                  required String id,
                  required IconData icon,
                  required String label,
                  required int count,
                  Color? color,
                }) {
                  final selected = _selectedCats.value.contains(id);
                  final bg = selected
                      ? (color ?? kCeruleanBlue).withOpacity(0.12)
                      : kBgGrayVisibility1;
                  final border =
                      selected ? (color ?? kCeruleanBlue) : Colors.transparent;
                  final textStyle = context.textTheme.labelLarge!.copyWith(
                    color: selected
                        ? (color ?? kCeruleanBlue)
                        : Theme.of(context).colorScheme.onSurface,
                  );

                  return ChoiceChip(
                    avatar: Icon(icon,
                        size: 18,
                        color: selected
                            ? (color ?? kCeruleanBlue)
                            : Theme.of(context).colorScheme.onSurface),
                    label: Text(count > 0 ? '$label ($count)' : label,
                        style: textStyle),
                    selected: selected,
                    pressElevation: 0,
                    backgroundColor: bg,
                    selectedColor: bg,
                    side: BorderSide(color: border, width: 1),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity:
                        const VisualDensity(horizontal: -2, vertical: -2),
                    onSelected: (v) {
                      setState(() {
                        v
                            ? _selectedCats.value.add(id)
                            : _selectedCats.value.remove(id);
                      });
                      context
                          .read<ContactsCubit>()
                          .load(categories: _selectedCats.value.toList());
                    },
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: kSpacingX2),
                  child: Row(
                    children: [
                      chip(
                        id: '1',
                        icon: Icons.local_pharmacy_outlined,
                        label: context.i10n.contactsPharmacien,
                        count: pharmCount,
                        color: kCeruleanBlue,
                      ),
                      SizedBox(width: kSpacingX2),
                      chip(
                        id: '2',
                        icon: Icons.medical_information_outlined,
                        label: context.i10n.contactsMedecin,
                        count: medCount,
                        color: kHighland,
                      ),
                      SizedBox(width: kSpacingX2),
                      chip(
                        id: '3',
                        icon: Icons.person_outline,
                        label: context.i10n.contactsPatient,
                        count: patientCount,
                        color: kCardinal,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(child: Text(message)),
                  loaded: (contacts) {
                    // Apply search and dropdown filters locally
                    final q = _searchQuery.toLowerCase();
                    final filtered = contacts.where((c) {
                      final inSearch = q.isEmpty
                          ? true
                          : [
                              c.nom ?? '',
                              c.prenom ?? '',
                              c.ville ?? '',
                              c.regionLib ?? '',
                            ]
                              .map((e) => e.toLowerCase())
                              .any((e) => e.contains(q));

                      final inWilaya = _selectedWilaya.isEmpty
                          ? true
                          : (c.wilayaId ?? '') == _selectedWilaya;
                      final inCommune = _selectedCommune.isEmpty
                          ? true
                          : (c.vilId ?? '') == _selectedCommune;

                      return inSearch && inWilaya && inCommune;
                    }).toList();

                    if (filtered.isEmpty) {
                      return Center(child: Text(context.i10n.contactsEmpty));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: kPaddingMd2,
                        vertical: kPaddingSm3,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) => _ContactCard(contact: filtered[i]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.contact});
  final Contact contact;

  String _catLabel(BuildContext context, String? cat) {
    switch (cat) {
      case '1':
        return context.i10n.contactsPharmacien;
      case '2':
        return context.i10n.contactsMedecin;
      case '3':
        return context.i10n.contactsPatient;
      default:
        return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = [contact.nom, contact.prenom]
        .where((e) => (e ?? '').isNotEmpty)
        .join(' ');
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(bottom: kSpacingX2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSpacingX3)),
      child: InkWell(
        borderRadius: BorderRadius.circular(kSpacingX3),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => ContactDetailsPage(contact: contact)),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(kPaddingMd2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileCard(
                size: 48,
                text: name.isNotEmpty ? name : (contact.nom ?? '-'),
                backgroundColor: kCeruleanBlue.shade100,
                borderColor: kCeruleanBlue,
                textStyle:
                    context.textTheme.labelLarge!.copyWith(color: kWhite),
              ),
              SizedBox(width: kSpacingX3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name.isNotEmpty ? name : (contact.nom ?? '-'),
                            style: context.textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSpacingX1),
                    Wrap(
                      spacing: kSpacingX2,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Chip(
                          label: Text(_catLabel(context, contact.categorie)),
                          backgroundColor: kBgGrayVisibility1,
                          padding: EdgeInsets.zero,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        if ((contact.ville ?? '').isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.location_on_outlined, size: 16),
                              SizedBox(width: kSpacingX1),
                              Text(contact.ville!),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: kSpacingX2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if ((contact.tel1 ?? '').isNotEmpty)
                    IconButton(
                      tooltip: 'Call',
                      icon: const Icon(Icons.call),
                      onPressed: () {
                        // leaving integration for url_launcher to future enhancement
                      },
                    ),
                  if ((contact.email ?? '').isNotEmpty)
                    IconButton(
                      tooltip: 'Email',
                      icon: const Icon(Icons.email_outlined),
                      onPressed: () {},
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
