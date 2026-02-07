// ClientSelectionForm.dart
import 'dart:developer';

import 'package:crm/core/core.dart';
import 'package:crm/features/contacts/bloc/specialite_lov_cubit.dart';
import 'package:crm/features/tour-plan/models/motif_visit/motif_visit.dart';
import 'package:crm/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/auth/auth_bloc.dart';
import '../../../models/person/person.dart';
import '../../../shared/widgets/inputs/date.time.picker.input.dart';
import '../../../shared/widgets/inputs/dropdown.input.dart';
import '../../contacts/bloc/contacts_cubit.dart';
import '../../contacts/models/contact.dart';
import '../../tour-plan/bloc/visit_motif_cubit.dart';
import '../../tour-plan/models/tour.dart';
import '../add_client_selection.dart';
import '../add_contact_selection.dart';
import '../bloc/contact_type_cubit.dart';
import '../models/contact_type.dart';
import '../widgets/selected_entity_header.dart';

class ClientSelectionForm extends StatefulWidget {
  final List<TourDetail> clients;
  final Map<String, dynamic> data;
  final QuillController quillController;
  final Function()? onQuillFocus;
  final Tour? tour;
  final Function()? onQuillChange;

  const ClientSelectionForm({
    super.key,
    required this.data,
    required this.clients,
    required this.quillController,
    this.onQuillFocus,
    this.tour,
    this.onQuillChange,
  });

  @override
  State<ClientSelectionForm> createState() => _ClientSelectionFormState();
}

class _ClientSelectionFormState extends State<ClientSelectionForm> {
  late User user;

  final FocusNode _quillFocusNode = FocusNode();
  Person? pharmacy;
  Contact? selectedContact; // for companyType==0
  bool _initializedContactFromPharmacieId = false;
  bool isReportValid = false;

  @override
  void initState() {
    super.initState();

    // Initialize the user from AuthBloc
    user = context.read<AuthBloc>().user;

    log("Tour: ${widget.tour?.toJson()}");

    // Initial validity for report
    isReportValid =
        widget.quillController.document.toPlainText().trim().length >=
            (user.minReportChar ?? 1);

    if (widget.data['pharmacieId'] != null) {
      pharmacy = widget.clients
          .where((element) {
            return '${element.pharmacy?.id.toString()}:${element.pharmacy?.typeTier}' ==
                widget.data['pharmacieId'];
          })
          .firstOrNull
          ?.pharmacy;
    } else {
      pharmacy = widget.clients.firstOrNull?.pharmacy;
    }

    // Update selected contact by searching widget.data['pharmacieId'] in the contacts cubit if companyType==0
    if (user.companyType == 1 && widget.data['pharmacieId'] != null) {
      final currentValue = (widget.data['pharmacieId'] ?? '').toString();
      final selectedId =
          int.tryParse(currentValue.split(':').firstOrNull ?? '');
      if (selectedId != null) {
        final contactsState = context.read<ContactsCubit>().state;
        contactsState.maybeWhen(
          loaded: (contacts) {
            final sc = contacts.firstWhere(
              (c) => c.id == selectedId,
              orElse: () => const Contact(),
            );
            selectedContact = sc.id == null ? null : sc;
          },
          orElse: () {},
        );
      }
    }

    _quillFocusNode.addListener(_handleQuillFocusChange);
    widget.quillController.addListener(() {
      final textLength =
          widget.quillController.document.toPlainText().trim().length;
      setState(() {
        isReportValid = textLength >= (user.minReportChar ?? 1);
      });
      widget.onQuillChange?.call();
    });

    // Ensure specialty LOV is loaded for patient specialty field
    final specialiteLovCubit = context.read<SpecialiteLovCubit?>();
    specialiteLovCubit?.load();
  }

  @override
  void dispose() {
    _quillFocusNode.removeListener(_handleQuillFocusChange);
    _quillFocusNode.dispose();
    super.dispose();
  }

  void _handleQuillFocusChange() {
    if (_quillFocusNode.hasFocus) {
      widget.onQuillFocus?.call();
    }
  }

  Future<void> _onAddContactPressed() async {
    final contactsCubit = context.read<ContactsCubit>();
    final hasData =
        contactsCubit.state.maybeWhen(loaded: (_) => true, orElse: () => false);
    if (!hasData) {
      await contactsCubit.load(categories: const ['1', '2', '3']);
    }
    final contact = await Navigator.push<Contact?>(
      context,
      MaterialPageRoute(builder: (context) => const AddContactSelection()),
    );
    if (!mounted || contact == null) return;

    setState(() {
      selectedContact = contact;
      widget.data['pharmacieId'] = contact.id == null ? '' : '${contact.id}:1';
      if ((contact.categorie ?? '').isNotEmpty) {
        widget.data['contactType'] = contact.categorie!;
      }
      widget.data['contact'] = {
        'nom': contact.nom,
        'prenom': contact.prenom,
        'ville': contact.ville,
        'adresse': contact.adresse,
      };
      _applyContactDefaults(contact);
    });
    widget.onQuillChange?.call();
  }

  void _applyContactDefaults(Contact contact) {
    void setValue(String key, String? value) {
      if (value == null || value.isEmpty) return;
      widget.data[key] = value;
    }

    widget.data['contactCategorie'] = contact.categorie ?? '';
    setValue('objections', contact.objections);

    switch (contact.categorie) {
      case '2':
        setValue('potentiel', contact.potentiel);
        setValue('connaissanceProduit', contact.connaissanceProduit);
        setValue('prescripteur', contact.prescripteur);
        break;
      case '3':
        setValue('medecinTraitant', contact.medecinTraitant);
        setValue('specialiteMedecin', contact.specialiteMedecin);
        setValue('typeDiabete', contact.typeDiabete);
        setValue('testeProduit', contact.testeProduit);
        setValue('resultatTest', contact.resultatTest);
        setValue('patientConnaissanceProduit', contact.connaissanceProduit);
        break;
    }
  }

  Widget _visitTextField(String key, String label, String hint,
      {TextInputType? keyboardType}) {
    final value = (widget.data[key] ?? '').toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label: label),
        TextFormField(
          key: ValueKey('$key-$value'),
          initialValue: value,
          keyboardType: keyboardType,
          decoration: InputDecoration(hintText: hint),
          onChanged: (v) {
            widget.data[key] = v;
            widget.onQuillChange?.call();
          },
        ),
        SizedBox(height: kSpacingX2),
      ],
    );
  }

  Widget _visitCheckboxField(String key, String label, String hint) {
    final checked =
        (widget.data[key] ?? 'NON').toString().toUpperCase() == 'OUI';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(label),
          subtitle: hint.isNotEmpty
              ? Text(
                  hint,
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: kCodGray.shade500),
                )
              : null,
          value: checked,
          onChanged: (value) {
            setState(() {
              widget.data[key] = (value ?? false) ? 'OUI' : 'NON';
            });
            widget.onQuillChange?.call();
          },
        ),
        SizedBox(height: kSpacingX1),
      ],
    );
  }

  Widget _visitDropdownField(
    String key,
    String label,
    String hint,
    List<DropdownMenuItem<String>> items,
  ) {
    final value = (widget.data[key] ?? '').toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label: label),
        DropdownButtonFormField<String>(
          value: value.isEmpty ? null : value,
          decoration: InputDecoration(hintText: hint),
          items: items,
          onChanged: (selected) {
            setState(() {
              widget.data[key] = selected ?? '';
            });
            widget.onQuillChange?.call();
          },
        ),
        SizedBox(height: kSpacingX2),
      ],
    );
  }

  Widget _visitSpecialiteMedecinDropdown(String label, String hint) {
    final value = (widget.data['specialiteMedecin'] ?? '').toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label: label),
        BlocBuilder<SpecialiteLovCubit, SpecialiteLovState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_) => TextFormField(
                key: ValueKey('specialiteMedecin-$value'),
                initialValue: value,
                decoration: InputDecoration(hintText: hint),
                onChanged: (v) {
                  widget.data['specialiteMedecin'] = v;
                  widget.onQuillChange?.call();
                },
              ),
              loaded: (items) {
                return DropdownButtonFormField<String>(
                  value: value.isEmpty ? null : value,
                  isExpanded: true,
                  decoration: InputDecoration(hintText: hint),
                  items: items
                      .map((e) => DropdownMenuItem<String>(
                            value: e.label,
                            child:
                                Text(e.label, overflow: TextOverflow.ellipsis),
                          ))
                      .toList(),
                  onChanged: (selected) {
                    setState(() {
                      widget.data['specialiteMedecin'] =
                          selected?.toString() ?? '';
                    });
                    widget.onQuillChange?.call();
                  },
                );
              },
              orElse: () => TextFormField(
                key: ValueKey('specialiteMedecin-$value'),
                initialValue: value,
                decoration: InputDecoration(hintText: hint),
                onChanged: (v) {
                  widget.data['specialiteMedecin'] = v;
                  widget.onQuillChange?.call();
                },
              ),
            );
          },
        ),
        SizedBox(height: kSpacingX2),
      ],
    );
  }

  Widget _buildVisitStatistics(Person? client) {
    if (client == null) return const SizedBox.shrink();

    final visitCount = client.visitCount ?? 0;
    final lastVisitDateStr = client.lastVisitDate;

    return Container(
      padding: EdgeInsets.all(kPaddingMd1),
      decoration: BoxDecoration(
        color: kCodGray.shade50,
        borderRadius: BorderRadius.circular(15.h),
        border: Border.all(color: kCodGray.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.i10n.visitCount,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: kCodGray.shade600,
                  ),
                ),
                SizedBox(height: kSpacingX1),
                Text(
                  '$visitCount',
                  style: context.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: kCodGray.shade200,
          ),
          SizedBox(width: kPaddingMd1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.i10n.lastVisitDate,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: kCodGray.shade600,
                  ),
                ),
                SizedBox(height: kSpacingX1),
                Text(
                  lastVisitDateStr != null && lastVisitDateStr.isNotEmpty
                      ? _formatDate(lastVisitDateStr)
                      : context.i10n.noVisitsYet,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return isoDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Selected entity header
                if (user.companyType == 0) ...[
                  SelectedEntityHeader(client: pharmacy),
                  if (pharmacy != null) ...[
                    SizedBox(height: kSpacingX3),
                    _buildVisitStatistics(pharmacy),
                  ],
                ] else if (selectedContact != null)
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(kPaddingSm3),
                        decoration: BoxDecoration(
                          color: kCodGray.shade100,
                          shape: BoxShape.circle,
                          border: Border.all(color: kCodGray.shade300),
                        ),
                        child: Text(
                          ('${selectedContact?.nom ?? ''} ${selectedContact?.prenom ?? ''}')
                              .trim()
                              .initials,
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(width: kSpacingX3),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context.i10n.contactLabel,
                                style: context.textTheme.bodyMedium),
                            SizedBox(height: kSpacingX1),
                            Text(
                              ('${selectedContact?.nom ?? ''} ${selectedContact?.prenom ?? ''}')
                                  .trim(),
                              style: context.textTheme.displaySmall,
                            ),
                            SizedBox(height: kSpacingX1),
                            Text(
                              [selectedContact?.ville, selectedContact?.adresse]
                                  .where((e) => (e ?? '').isNotEmpty)
                                  .join(' • '),
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                Text(
                  context.i10n.visitCreationTitle,
                  style: context.textTheme.displayMedium,
                ),
                SizedBox(height: kSpacingX3),
                Text(
                  context.i10n.visitCreationDescription,
                  style: context.textTheme.bodyLarge,
                ),
                SizedBox(height: kSpacingX7),
                if (user.companyType == 0) ...[
                  Text(
                    context.i10n.visitCreationClientLabel,
                    style: context.textTheme.bodyMedium,
                  ),
                  SizedBox(height: kSpacingX1),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropDownInput(
                          data: widget.data,
                          mapKey: 'pharmacieId',
                          items: [
                            if (pharmacy == null)
                              CustomDropDownItem(
                                label: context.i10n.selectClient,
                                value: "",
                              ),
                            if (pharmacy != null)
                              CustomDropDownItem(
                                label: pharmacy!.fullName,
                                value: '${pharmacy!.id}:${pharmacy!.typeTier}',
                              ),
                            ...widget.clients
                                .where((e) =>
                                    e.pharmacy != null &&
                                    '${e.pharmacy?.id}:${e.pharmacy?.typeTier}' !=
                                        widget.data['pharmacieId'])
                                .map(
                                  (e) => CustomDropDownItem(
                                    label: e.pharmacy?.fullName ?? "",
                                    value:
                                        '${e.pharmacy?.id}:${e.pharmacy?.typeTier}',
                                  ),
                                ),
                          ],
                          onChanged: (_) {
                            setState(() {
                              // Update local pharmacy instance for header
                              pharmacy = widget.clients
                                  .where((e) =>
                                      '${e.pharmacy?.id}:${e.pharmacy?.typeTier}' ==
                                      widget.data['pharmacieId'])
                                  .firstOrNull
                                  ?.pharmacy;
                            });
                          },
                        ),
                      ),
                      if (context.user.addVisitOutPlanPrivilege == true)
                        Row(
                          children: [
                            SizedBox(width: kPaddingSm2),
                            IconButton(
                              onPressed: () async {
                                Person? pharmacy = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddClientSelection()),
                                );

                                if (!context.mounted || pharmacy == null)
                                  return;

                                setState(() {
                                  widget.data['pharmacieId'] =
                                      '${pharmacy.id.toString()}:${pharmacy.typeTier.toString()}';
                                  widget.data['tourneeId'] = null;
                                  this.pharmacy = pharmacy;
                                });
                                widget.onQuillChange?.call();
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                    ],
                  ),
                ] else ...[
                  // companyType == 0 -> use ContactsCubit to list contacts included in the tour
                  Text(context.i10n.contactLabel,
                      style: context.textTheme.bodyMedium),
                  SizedBox(height: kSpacingX1),
                  BlocBuilder<ContactsCubit, ContactsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () => const CircularProgressIndicator(),
                        initial: () => const CircularProgressIndicator(),
                        error: (_) => const SizedBox.shrink(),
                        loaded: (contacts) {
                          final allowedContactIds = widget.clients
                              .map((detail) => detail.pharmacy?.id)
                              .whereType<int>()
                              .toSet();

                          var filteredContacts = contacts
                              .where((c) =>
                                  c.id != null &&
                                  allowedContactIds.contains(c.id))
                              .toList();

                          // Find current value from data['pharmacieId'] (format id:1)
                          final currentValue =
                              (widget.data['pharmacieId'] ?? '').toString();
                          final selectedId = int.tryParse(
                              currentValue.split(':').firstOrNull ?? '');
                          if (selectedId != null && selectedContact == null) {
                            final sc = contacts.firstWhere(
                              (c) => c.id == selectedId,
                              orElse: () => const Contact(),
                            );
                            selectedContact = sc.id == null ? null : sc;
                            if (selectedContact != null) {
                              if ((widget.data['contactType'] ?? '')
                                      .toString()
                                      .isEmpty &&
                                  (selectedContact!.categorie ?? '')
                                      .isNotEmpty) {
                                widget.data['contactType'] =
                                    selectedContact!.categorie!;
                              }
                              widget.data['contact'] = {
                                'nom': selectedContact!.nom,
                                'prenom': selectedContact!.prenom,
                                'ville': selectedContact!.ville,
                                'adresse': selectedContact!.adresse,
                              };
                              _applyContactDefaults(selectedContact!);
                              if (!_initializedContactFromPharmacieId) {
                                _initializedContactFromPharmacieId = true;
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (!mounted) return;
                                  setState(() {});
                                  widget.onQuillChange?.call();
                                });
                              }
                            }
                          }

                          if (filteredContacts.isNotEmpty &&
                              (widget.data['pharmacieId'] ?? '')
                                  .toString()
                                  .isEmpty) {
                            final firstContact = filteredContacts.first;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (!mounted) return;
                              setState(() {
                                widget.data['pharmacieId'] =
                                    firstContact.id == null
                                        ? ''
                                        : '${firstContact.id}:1';
                                selectedContact = firstContact;
                                if ((firstContact.categorie ?? '').isNotEmpty) {
                                  widget.data['contactType'] =
                                      firstContact.categorie!;
                                }
                                widget.data['contact'] = {
                                  'nom': firstContact.nom,
                                  'prenom': firstContact.prenom,
                                  'ville': firstContact.ville,
                                  'adresse': firstContact.adresse,
                                };
                                _applyContactDefaults(firstContact);
                              });
                              widget.onQuillChange?.call();
                            });
                          }

                          // Ensure selected contact remains visible even if outside tour list
                          if (selectedContact != null &&
                              selectedContact!.id != null &&
                              filteredContacts
                                  .every((c) => c.id != selectedContact!.id)) {
                            filteredContacts = [
                              selectedContact!,
                              ...filteredContacts,
                            ];
                          }

                          filteredContacts.sort((a, b) {
                            final nameA =
                                ('${a.nom ?? ''} ${a.prenom ?? ''}').trim();
                            final nameB =
                                ('${b.nom ?? ''} ${b.prenom ?? ''}').trim();
                            return nameA.compareTo(nameB);
                          });

                          if (filteredContacts.isEmpty) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    context.i10n.tourCreationClientEmptyTitle,
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ),
                                if (context.user.addVisitOutPlanPrivilege ==
                                    true) ...[
                                  SizedBox(width: kPaddingSm2),
                                  IconButton(
                                    onPressed: _onAddContactPressed,
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ],
                            );
                          }

                          final items = <CustomDropDownItem>[
                            ...filteredContacts.map((c) {
                              final label = ('${c.nom ?? ''} ${c.prenom ?? ''}')
                                      .trim()
                                      .isEmpty
                                  ? (c.nom ?? context.i10n.contactLabel)
                                  : ('${c.nom ?? ''} ${c.prenom ?? ''}').trim();
                              return CustomDropDownItem(
                                label: label,
                                value: '${c.id}:1',
                              );
                            }),
                          ];

                          String initialValue = currentValue;
                          if (!items.any((i) => i.value == currentValue)) {
                            initialValue =
                                items.isNotEmpty ? items.first.value : '';
                          }

                          final dropdown = CustomDropDownInput(
                            data: widget.data,
                            mapKey: 'pharmacieId',
                            items: items,
                            initialValue: initialValue,
                            onChanged: (value) {
                              setState(() {
                                widget.data['pharmacieId'] = value ?? '';
                                final id = int.tryParse(
                                    (value ?? '').split(':').firstOrNull ?? '');
                                final sc = (id == null)
                                    ? const Contact()
                                    : contacts.firstWhere(
                                        (c) => c.id == id,
                                        orElse: () => const Contact(),
                                      );
                                selectedContact = sc.id == null ? null : sc;

                                if (selectedContact?.categorie != null) {
                                  widget.data['contactType'] =
                                      selectedContact!.categorie!;
                                }

                                if (selectedContact != null) {
                                  widget.data['contact'] = {
                                    'nom': selectedContact!.nom,
                                    'prenom': selectedContact!.prenom,
                                    'ville': selectedContact!.ville,
                                    'adresse': selectedContact!.adresse,
                                  };
                                  _applyContactDefaults(selectedContact!);
                                } else {
                                  widget.data.remove('contact');
                                  widget.data.remove('contactCategorie');
                                }
                              });
                              widget.onQuillChange?.call();
                            },
                          );

                          return Row(
                            children: [
                              Expanded(child: dropdown),
                              if (context.user.addVisitOutPlanPrivilege ==
                                  true) ...[
                                SizedBox(width: kPaddingSm2),
                                IconButton(
                                  onPressed: _onAddContactPressed,
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ],
                          );
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ],

                SizedBox(height: kSpacingX5),
                Text(
                  context.i10n.visitCreationDateLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
                CustomDateTimePicker(
                  data: widget.data,
                  firstDate: DateTime.parse(
                      widget.tour?.startDate ?? DateTime.now().toString()),
                  initialDate: DateTime.now(),
                  onChanged: (value) {
                    widget.onQuillChange?.call();
                  },
                  mapKey: 'dateDebut',
                ),
                SizedBox(height: kSpacingX5),
                // Contact type dropdown (auto-filled for companyType==0, but keep visible)
                Text(context.i10n.visitCreationContactTypeLabel,
                    style: context.textTheme.bodyMedium),
                SizedBox(height: kSpacingX1),
                BlocBuilder<ContactTypeCubit, List<ContactType>>(
                  builder: (context, state) {
                    if (state.isEmpty) {
                      return const CircularProgressIndicator();
                    }
                    final items = [
                      CustomDropDownItem(
                          label: context.i10n.selectReason, value: ''),
                      ...state.map(
                        (e) => CustomDropDownItem(
                            label: e.label, value: e.id.toString()),
                      ),
                    ];

                    final currentValue =
                        (widget.data['contactType'] ?? '') as String;

                    return CustomDropDownInput(
                      data: widget.data,
                      mapKey: 'contactType',
                      items: items,
                      initialValue: items.any((i) => i.value == currentValue)
                          ? currentValue
                          : items.first.value,
                      onChanged: (value) {
                        setState(() {
                          widget.data['contactType'] = value ?? '';
                        });
                        widget.onQuillChange?.call();
                      },
                    );
                  },
                ),
                SizedBox(height: kSpacingX5),
                Text(
                  context.i10n.visitCreationReasonLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
                BlocBuilder<MotifVisitCubit, List<MotifVisit>>(
                  builder: (context, state) {
                    if (state.isEmpty) {
                      return const CircularProgressIndicator();
                    } else {
                      // Deduplicate motifs by id
                      final uniqueMotifs = <MotifVisit>{};
                      final deduplicatedMotifs = state
                          .where((motif) => uniqueMotifs.add(motif))
                          .toList();

                      // Extract values from dropdown items
                      final itemValues = <String>[
                        ...deduplicatedMotifs
                            .map((motif) => motif.id.toString()),
                      ];

                      // Ensure the current value exists in items; default to empty if not
                      final currentValue = widget.data['motif'] == null ||
                              !itemValues.contains(widget.data['motif'])
                          ? ""
                          : widget.data['motif'];

                      return CustomDropDownInput(
                        data: widget.data,
                        mapKey: 'motif',
                        items: [
                          CustomDropDownItem(
                            label: context.i10n.selectReason,
                            value: "",
                          ),
                          ...deduplicatedMotifs.map(
                            (motif) => CustomDropDownItem(
                              value: motif.id.toString(),
                              label: motif.label ?? "",
                            ),
                          ),
                        ],
                        initialValue: currentValue,
                        onChanged: (value) {
                          setState(() {
                            widget.data['motif'] = value;
                          });
                          widget.onQuillChange?.call();
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: kSpacingX5),

                // Activation visit checkbox - only show if client is inactive
                if (pharmacy?.inactifFlag == true ||
                    selectedContact?.inactifFlag == true) ...[
                  CheckboxListTile(
                    value: widget.data['visiteActivation'] == true,
                    onChanged: (bool? value) {
                      setState(() {
                        widget.data['visiteActivation'] = value ?? false;
                      });
                      widget.onQuillChange?.call();
                    },
                    title: Text(
                      context.i10n.visitActivationLabel,
                      style: context.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      context.i10n.visitActivationHint,
                      style: context.textTheme.bodySmall,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                  SizedBox(height: kSpacingX3),
                ],

                // Dynamic visit attributes by selected contact type
                Builder(builder: (context) {
                  final ct = selectedContact?.categorie ?? '';
                  if (ct.isEmpty) return const SizedBox.shrink();
                  final fields = <Widget>[];

                  if (ct == '1') {
                    fields.addAll([
                      _visitTextField(
                        'nomInterlocuteur',
                        context.i10n.visitFieldNomInterlocuteur,
                        context.i10n.visitHintNomInterlocuteur,
                      ),
                      _visitTextField(
                        'fonction',
                        context.i10n.visitFieldFonction,
                        context.i10n.visitHintFonction,
                      ),
                      _visitCheckboxField(
                        'receptionPrescription',
                        context.i10n.visitFieldReceptionPrescription,
                        context.i10n.visitHintReceptionPrescription,
                      ),
                      _visitTextField(
                        'prescriptionDetails',
                        context.i10n.visitFieldPrescriptionDetails,
                        context.i10n.visitHintPrescriptionDetails,
                      ),
                      _visitTextField(
                        'produitConcurrent',
                        context.i10n.visitFieldProduitConcurrent,
                        context.i10n.visitHintProduitConcurrent,
                      ),
                      _visitTextField(
                        'objections',
                        context.i10n.visitFieldObjections,
                        context.i10n.visitHintObjections,
                      ),
                    ]);
                  } else if (ct == '2') {
                    fields.addAll([
                      _visitDropdownField(
                        'potentiel',
                        context.i10n.visitFieldPotentiel,
                        context.i10n.visitHintPotentiel,
                        [
                          DropdownMenuItem(value: 'A', child: Text('A')),
                          DropdownMenuItem(value: 'B', child: Text('B')),
                          DropdownMenuItem(value: 'C', child: Text('C')),
                        ],
                      ),
                      _visitCheckboxField(
                        'connaissanceProduit',
                        context.i10n.visitFieldConnaissanceProduit,
                        context.i10n.visitHintConnaissanceProduit,
                      ),
                      _visitCheckboxField(
                        'prescripteur',
                        context.i10n.visitFieldPrescripteur,
                        context.i10n.visitHintPrescripteur,
                      ),
                      _visitCheckboxField(
                        'promessePrescription',
                        context.i10n.visitFieldPromessePrescription,
                        context.i10n.visitHintPromessePrescription,
                      ),
                      _visitTextField(
                        'objections',
                        context.i10n.visitFieldObjections,
                        context.i10n.visitHintObjections,
                      ),
                    ]);
                  } else if (ct == '3') {
                    fields.addAll([
                      _visitTextField(
                        'medecinTraitant',
                        context.i10n.visitFieldMedecinTraitant,
                        context.i10n.visitHintMedecinTraitant,
                      ),
                      // Patient's doctor's specialty dropdown sourced from LOV 201
                      _visitSpecialiteMedecinDropdown(
                        context.i10n.visitFieldSpecialiteMedecin,
                        context.i10n.visitHintSpecialiteMedecin,
                      ),
                      _visitDropdownField(
                        'typeDiabete',
                        context.i10n.visitFieldTypeDiabete,
                        context.i10n.visitHintTypeDiabete,
                        [
                          DropdownMenuItem(
                              value: 'Type 1', child: Text('Type 1')),
                          DropdownMenuItem(
                              value: 'Type 2', child: Text('Type 2')),
                        ],
                      ),
                      _visitCheckboxField(
                        'patientConnaissanceProduit',
                        context.i10n.visitFieldPatientConnaissanceProduit,
                        context.i10n.visitHintPatientConnaissanceProduit,
                      ),
                      _visitCheckboxField(
                        'testeProduit',
                        context.i10n.visitFieldTesteProduit,
                        context.i10n.visitHintTesteProduit,
                      ),
                      _visitTextField(
                        'resultatTest',
                        context.i10n.visitFieldResultatTest,
                        context.i10n.visitHintResultatTest,
                      ),
                      _visitTextField(
                        'objections',
                        context.i10n.visitFieldObjections,
                        context.i10n.visitHintObjections,
                      ),
                    ]);
                  }

                  return Column(children: fields);
                }),
                SizedBox(height: kSpacingX5),
                Text(
                  context.i10n.visitCreationRapportLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
                // Add error message if report is too short
                if (!isReportValid)
                  Padding(
                    padding: EdgeInsets.only(top: kSpacingX1),
                    child: Text(
                      context.i10n.visitCreationRapportMinCharError(
                          user.minReportChar ?? 1),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  child: QuillEditor(
                    focusNode: _quillFocusNode,
                    controller: widget.quillController,
                    config: QuillEditorConfig(
                      scrollable: true,
                      autoFocus: false,
                      placeholder: context.i10n.visitCreationRapportPlaceholder,
                      expands: false,
                      showCursor: true,
                    ),
                    scrollController: ScrollController(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;

  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: kSpacingX1),
      child: RichText(
        text: TextSpan(
          style: context.textTheme.labelLarge?.copyWith(color: kText1),
          children: [
            TextSpan(text: label),
          ],
        ),
      ),
    );
  }
}
