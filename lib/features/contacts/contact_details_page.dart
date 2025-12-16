import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';
import 'contact_form_page.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({super.key, required this.contact});
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
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.viewDetails),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => ContactFormPage(contact: contact)),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(kPaddingMd2),
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(kPaddingMd2),
            decoration: BoxDecoration(
              color: kBgGrayVisibility1,
              borderRadius: BorderRadius.circular(kSpacingX3),
              border: Border.all(color: kBorder3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name.isNotEmpty ? name : (contact.nom ?? '-'),
                    style: context.textTheme.headlineSmall),
                SizedBox(height: kSpacingX1),
                Wrap(
                  spacing: kSpacingX2,
                  children: [
                    Chip(label: Text(_catLabel(context, contact.categorie))),
                    if ((contact.ville ?? '').isNotEmpty)
                      Chip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.location_on_outlined, size: 16),
                            SizedBox(width: kSpacingX1),
                            Text(contact.ville!),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingX4),

          // General Info
          _Section(
            title: context.i10n.contactsGeneralInfo,
            children: [
              _InfoRow(label: context.i10n.name, value: contact.nom ?? '-'),
              _InfoRow(
                  label: context.i10n.firstName, value: contact.prenom ?? '-'),
              _InfoRow(
                  label: context.i10n.contactsCategorie,
                  value: _catLabel(context, contact.categorie)),
            ],
          ),

          // Contact info
          _Section(
            title: context.i10n.contactsContactInfo,
            children: [
              _InfoRow(label: 'email', value: contact.email ?? '-'),
              _InfoRow(label: 'tel1', value: contact.tel1 ?? '-'),
              _InfoRow(label: 'tel2', value: contact.tel2 ?? '-'),
              _InfoRow(
                  label: context.i10n.address, value: contact.adresse ?? '-'),
              _InfoRow(label: context.i10n.city, value: contact.ville ?? '-'),
              _InfoRow(label: 'wilayaId', value: contact.wilayaId ?? '-'),
              _InfoRow(label: 'regionLib', value: contact.regionLib ?? '-'),
              _InfoRow(label: 'vilId', value: contact.vilId ?? '-'),
            ],
          ),

          if (contact.categorie == '1')
            _Section(
              title: context.i10n.contactsPharmacienDetails,
              children: [
                _InfoRow(label: 'rcCode', value: contact.rcCode ?? '-'),
                _InfoRow(label: 'fiscalCode', value: contact.fiscalCode ?? '-'),
                _InfoRow(label: 'nis', value: contact.nis ?? '-'),
                _InfoRow(
                    label: 'articleCode', value: contact.articleCode ?? '-'),
              ],
            ),

          if (contact.categorie == '2')
            _Section(
              title: context.i10n.contactsMedecinDetails,
              children: [
                _InfoRow(label: 'specialite', value: contact.specialite ?? '-'),
                _InfoRow(label: 'potentiel', value: contact.potentiel ?? '-'),
                _InfoRow(
                    label: 'connaissanceProduit',
                    value: contact.connaissanceProduit ?? '-'),
                _InfoRow(
                    label: 'prescripteur', value: contact.prescripteur ?? '-'),
                _InfoRow(label: 'objections', value: contact.objections ?? '-'),
              ],
            ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(kSpacingX3),
        border: Border.all(color: kBorder3),
      ),
      margin: EdgeInsets.only(bottom: kSpacingX4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(kPaddingMd2),
            child: Text(title, style: context.textTheme.titleMedium),
          ),
          const Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(kPaddingMd2),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kPaddingSm2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label,
                style: context.textTheme.bodyMedium!.copyWith(color: kText4)),
          ),
          Expanded(
            child: Text(value, style: context.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
