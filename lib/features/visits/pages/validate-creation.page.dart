import 'package:crm/features/tour-plan/bloc/clients/clients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../models/person/person.dart';
import '../../contacts/models/contact.dart';
import '../../../shared/services/helpers/location.helper.dart';
import '../../tour-plan/models/tour.dart';
import '../bloc/visit-creation/visit_creation_cubit.dart';
import '../../tour-plan/models/motif_visit/motif_visit.dart';
import '../../tour-plan/bloc/visit_motif_cubit.dart';
import '../bloc/contact_type_cubit.dart';
import '../models/contact_type.dart';

class VisitValidateCreationPage extends StatelessWidget {
  final Tour tour;
  final Map<String, dynamic> data;

  const VisitValidateCreationPage(
      {super.key, required this.data, required this.tour});

  @override
  Widget build(BuildContext context) {
    List<TourDetail> clients = tour.pharmacies
            ?.where(
              (element) =>
                  '${element.pharmacy?.id.toString()}:${element.pharmacy?.typeTier}' ==
                  data['pharmacieId'],
            )
            .toList() ??
        [];
    TourDetail? client = clients.isNotEmpty ? clients.first : null;
    Person? pharmacy;
    if (client == null) {
      pharmacy = context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => null,
          loaded: (all, filter) {
            return all
                .where(
                  (element) =>
                      '${element.id.toString()}:${element.typeTier}' ==
                      data['pharmacieId'],
                )
                .firstOrNull;
          });
    }
    // Selected contact (if any)
    final Contact? selectedContact = (data['contact'] is Map<String, dynamic>)
        ? Contact.fromJson(data['contact'] as Map<String, dynamic>)
        : null;
    final String selectedCategory =
        (data['contactCategorie'] ?? selectedContact?.categorie ?? '')
            .toString();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: kPaddingMd2,
        vertical: kPaddingMd2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<VisitCreationCubit, VisitCreationState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                failure: (message) => Container(
                    padding: EdgeInsets.all(kPaddingMd2),
                    margin: EdgeInsets.only(bottom: kSpacingX6),
                    decoration: BoxDecoration(
                      color: kCardinal.shade100,
                      borderRadius: BorderRadius.circular(kSpacingX3),
                      border: Border.all(color: kCardinal.shade300),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_rounded,
                          color: kCardinal.shade600,
                        ),
                        SizedBox(width: kSpacingX5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.tourCreationErrorTitle,
                                style: context.textTheme.headlineMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                message,
                                softWrap: true,
                                maxLines: 3,
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
          Text(
            context.i10n.visitValidationTitle,
            style: context.textTheme.titleLarge,
          ),
          SizedBox(height: kSpacingX5),
          Container(
            padding: EdgeInsets.all(kPaddingMd1),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(kSpacingX3),
              border: Border.all(color: kBorder3),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(kPaddingSm3),
                  decoration: BoxDecoration(
                    color: kCodGray.shade100,
                    shape: BoxShape.circle,
                    border: Border.all(color: kCodGray.shade300),
                  ),
                  child: Text(
                    (selectedContact != null
                            ? (('${selectedContact.nom ?? ''} ${selectedContact.prenom ?? ''}')
                                .trim()
                                .initials)
                            : (client?.pharmacy?.fullName.initials ??
                                pharmacy?.fullName.initials)) ??
                        '',
                    style: context.textTheme.bodySmall,
                  ),
                ),
                SizedBox(width: kSpacingX3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedContact != null
                            ? 'Contact'
                            : context.i10n.visitValidationClient,
                        style: context.textTheme.bodySmall,
                      ),
                      SizedBox(height: kSpacingX1),
                      Text(
                        selectedContact != null
                            ? (('${selectedContact.nom ?? ''} ${selectedContact.prenom ?? ''}')
                                .trim())
                            : (client?.pharmacy?.fullName ??
                                pharmacy?.fullName ??
                                ''),
                        style: context.textTheme.titleMedium,
                      ),
                      SizedBox(height: kSpacingX1),
                      if (selectedContact != null)
                        Text(
                          [selectedContact.ville, selectedContact.adresse]
                              .where((e) => (e ?? '').isNotEmpty)
                              .join(' • '),
                          style: context.textTheme.bodySmall,
                        )
                      else
                        _VisitAddressLabel(client: client, pharmacy: pharmacy),
                    ],
                  ),
                ),
                SizedBox(width: kSpacingX2),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.phone_rounded, color: kPrimaryColor, size: 18),
                    SizedBox(height: kSpacingX1),
                    Icon(Icons.email_rounded, color: kPrimaryColor, size: 18),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: kSpacingX4),
          _VisitDetailsCard(data: data, category: selectedCategory),
          SizedBox(height: kSpacingX4),
          const Divider(),
          SizedBox(height: kSpacingX2),
          Text(
            context.i10n.visitValidationRapport,
            style: context.textTheme.titleMedium,
          ),
          SizedBox(height: kSpacingX2),
          SizedBox(
            height: 240,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: kPaddingMd2,
                vertical: kPaddingSm3,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: kBorder3),
                borderRadius: BorderRadius.circular(kSpacingX3),
              ),
              child: QuillEditor.basic(
                controller: QuillController(
                  document: data['document'],
                  selection: const TextSelection.collapsed(offset: 0),
                  readOnly: true,
                ),
                config: QuillEditorConfig(showCursor: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VisitDetailsCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String category;

  const _VisitDetailsCard({required this.data, this.category = ''});

  @override
  Widget build(BuildContext context) {
    final staticRows = _buildStaticRows(context);
    final attributeRows = _buildAttributeRows(context, category);
    final hasContactType = _hasValue('contactType');
    final hasMotif = _hasValue('motif');

    final hasContent = staticRows.isNotEmpty ||
        attributeRows.isNotEmpty ||
        hasContactType ||
        hasMotif;

    if (!hasContent) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kPaddingMd2),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(kSpacingX3),
        border: Border.all(color: kBorder3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...staticRows,
          if (hasContactType)
            BlocBuilder<ContactTypeCubit, List<ContactType>>(
              builder: (context, state) {
                if (state.isEmpty) return const SizedBox.shrink();
                final selectedId = (data['contactType'] ?? '').toString();
                final ContactType? match = _findContactType(state, selectedId);
                if (match == null || match.label.isEmpty) {
                  return const SizedBox.shrink();
                }
                return _DetailRow(
                  label: context.i10n.visitCreationContactTypeLabel,
                  value: match.label,
                );
              },
            ),
          if (hasMotif)
            BlocBuilder<MotifVisitCubit, List<MotifVisit>>(
              builder: (context, state) {
                if (state.isEmpty) return const SizedBox.shrink();
                final selectedId = (data['motif'] ?? '').toString();
                final MotifVisit? match = _findMotif(state, selectedId);
                final label = match?.label ?? '';
                if (label.isEmpty) return const SizedBox.shrink();
                return _DetailRow(
                  label: context.i10n.visitValidationReason,
                  value: label,
                );
              },
            ),
          ...attributeRows,
        ],
      ),
    );
  }

  List<Widget> _buildStaticRows(BuildContext context) {
    final rows = <Widget>[];
    final visitedAt = _formatDate(context);
    if (visitedAt != null) {
      rows.add(
        _DetailRow(
          label: context.i10n.visitValidationVisitedAt,
          value: visitedAt,
        ),
      );
    }
    return rows;
  }

  static const Map<String, List<String>> _categoryFieldMap = {
    '1': [
      'nomInterlocuteur',
      'fonction',
      'receptionPrescription',
      'prescriptionDetails',
      'produitConcurrent',
      'objections',
    ],
    '2': [
      'potentiel',
      'connaissanceProduit',
      'prescripteur',
      'promessePrescription',
      'objections',
    ],
    '3': [
      'medecinTraitant',
      'specialiteMedecin',
      'typeDiabete',
      'patientConnaissanceProduit',
      'testeProduit',
      'resultatTest',
      'objections',
    ],
  };

  List<Widget> _buildAttributeRows(BuildContext context, String category) {
    final labelMap = <String, String>{
      'nomInterlocuteur': context.i10n.visitFieldNomInterlocuteur,
      'fonction': context.i10n.visitFieldFonction,
      'receptionPrescription': context.i10n.visitFieldReceptionPrescription,
      'prescriptionDetails': context.i10n.visitFieldPrescriptionDetails,
      'produitConcurrent': context.i10n.visitFieldProduitConcurrent,
      'objections': context.i10n.visitFieldObjections,
      'potentiel': context.i10n.visitFieldPotentiel,
      'connaissanceProduit': context.i10n.visitFieldConnaissanceProduit,
      'prescripteur': context.i10n.visitFieldPrescripteur,
      'promessePrescription': context.i10n.visitFieldPromessePrescription,
      'medecinTraitant': context.i10n.visitFieldMedecinTraitant,
      'specialiteMedecin': context.i10n.visitFieldSpecialiteMedecin,
      'typeDiabete': context.i10n.visitFieldTypeDiabete,
      'patientConnaissanceProduit':
          context.i10n.visitFieldPatientConnaissanceProduit,
      'testeProduit': context.i10n.visitFieldTesteProduit,
      'resultatTest': context.i10n.visitFieldResultatTest,
    };

    final yesNoKeys = <String>{
      'receptionPrescription',
      'connaissanceProduit',
      'prescripteur',
      'promessePrescription',
      'patientConnaissanceProduit',
      'testeProduit',
    };

    final rows = <Widget>[];
    final filteredKeys =
        (category.isNotEmpty && _categoryFieldMap.containsKey(category))
            ? _categoryFieldMap[category]!
            : <String>[];

    for (final key in filteredKeys) {
      final label = labelMap[key];
      if (label == null) continue;
      final rawValue = data[key];
      final value = (rawValue ?? '').toString().trim();
      if (value.isEmpty) {
        continue;
      }
      final displayValue =
          yesNoKeys.contains(key) ? _formatBoolean(context, value) : value;
      rows.add(_DetailRow(label: label, value: displayValue));
    }
    return rows;
  }

  bool _hasValue(String key) {
    final value = (data[key] ?? '').toString().trim();
    return value.isNotEmpty;
  }

  String? _formatDate(BuildContext context) {
    final rawValue = (data['dateDebut'] ?? '').toString().trim();
    if (rawValue.isEmpty) return null;
    try {
      final parsed = DateTime.parse(rawValue);
      final locale = Localizations.localeOf(context).languageCode;
      return DateFormat('dd MMM yyyy HH:mm', locale).format(parsed);
    } catch (_) {
      return rawValue;
    }
  }

  String _formatBoolean(BuildContext context, String value) {
    final normalized = value.toUpperCase();
    if (normalized == 'OUI') return context.i10n.yesLabel;
    if (normalized == 'NON') return context.i10n.noLabel;
    return value;
  }

  ContactType? _findContactType(List<ContactType> types, String id) {
    for (final type in types) {
      if (type.id.toString() == id) return type;
    }
    return null;
  }

  MotifVisit? _findMotif(List<MotifVisit> motifs, String id) {
    for (final motif in motifs) {
      if (motif.id.toString() == id) return motif;
    }
    return null;
  }
}

class _VisitAddressLabel extends StatelessWidget {
  final TourDetail? client;
  final Person? pharmacy;

  const _VisitAddressLabel({this.client, this.pharmacy});

  @override
  Widget build(BuildContext context) {
    final latitude = client?.pharmacy?.latitude ?? pharmacy?.latitude;
    final longitude = client?.pharmacy?.longitude ?? pharmacy?.longitude;
    if (latitude != null && longitude != null) {
      return FutureBuilder<String>(
        future: LocationHelper.addressFromLongitudeLatitude(
          latitude: latitude,
          longitude: longitude,
        ),
        builder: (context, snapshot) {
          final text = (snapshot.data ?? '').isNotEmpty
              ? snapshot.data!
              : context.i10n.tourCreationNoAddress;
          return Text(
            text,
            style: context.textTheme.bodySmall,
          );
        },
      );
    }
    return Text(
      context.i10n.tourCreationNoAddress,
      style: context.textTheme.bodySmall,
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: kSpacingX2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: kCodGray.shade600,
            ),
          ),
          SizedBox(height: kSpacingX1),
          Text(
            value,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
