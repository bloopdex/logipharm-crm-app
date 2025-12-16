import 'package:crm/core/core.dart';
import 'package:crm/features/contacts/models/contact.dart';
import 'package:crm/models/person/person.dart';
import 'package:flutter/material.dart';

/// A compact header card showing the selected client or contact details.
/// Supply either [client] (Person) or [contact] (Contact). If both are provided,
/// client fields take precedence for the title; secondary details will show where available.
class SelectedEntityHeader extends StatelessWidget {
  const SelectedEntityHeader({super.key, this.client, this.contact});

  final Person? client;
  final Contact? contact;

  String _displayName() {
    final clientName = client?.fullName;
    if ((clientName ?? '').isNotEmpty) return clientName!;
    final parts = [contact?.nom, contact?.prenom].where((e) => (e ?? '').isNotEmpty).toList();
    return parts.isNotEmpty ? parts.join(' ') : '-';
  }

  String? _email() => client?.email ?? contact?.email;
  String? _phone() => client?.telMobile ?? client?.tel1Fixe ?? client?.tel2Fixe ?? contact?.tel1;
  String? _city() => client?.ville ?? contact?.ville;
  String? _address() => client?.address ?? contact?.adresse;

  @override
  Widget build(BuildContext context) {
    if (client == null && contact == null) return const SizedBox.shrink();

    final title = _displayName();
    final email = _email();
    final phone = _phone();
    final city = _city();
    final address = _address();

    return Card(
      margin: EdgeInsets.only(bottom: kSpacingX3),
      elevation: 0,
      color: kBgGrayVisibility1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSpacingX3)),
      child: Padding(
        padding: EdgeInsets.all(kPaddingMd2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: kCodGray.shade100,
                shape: BoxShape.circle,
                border: Border.all(color: kCodGray.shade300),
              ),
              alignment: Alignment.center,
              child: Text(
                title.initials,
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: kSpacingX3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: context.textTheme.titleMedium, overflow: TextOverflow.ellipsis),
                  SizedBox(height: kSpacingX1),
                  Wrap(
                    spacing: kSpacingX2,
                    runSpacing: kSpacingX1,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if ((city ?? '').isNotEmpty)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.location_on_outlined, size: 16),
                            SizedBox(width: kSpacingX1),
                            Text(city!),
                          ],
                        ),
                      if ((address ?? '').isNotEmpty)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.home_outlined, size: 16),
                            SizedBox(width: kSpacingX1),
                            Expanded(child: Text(address!)),
                          ],
                        ),
                      if (contact?.categorie != null)
                        Chip(
                          label: Text(_categoryLabel(context, contact!.categorie)),
                          backgroundColor: kBgGrayVisibility2,
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                        ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: kSpacingX2),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if ((phone ?? '').isNotEmpty) Icon(Icons.phone_rounded, color: kPrimaryColor),
                if ((email ?? '').isNotEmpty) ...[
                  SizedBox(height: kSpacingX1),
                  Icon(Icons.email_rounded, color: kPrimaryColor),
                ],
              ],
            )
          ],
        ),
      ),
    );
  }

  String _categoryLabel(BuildContext context, String? cat) {
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
}
