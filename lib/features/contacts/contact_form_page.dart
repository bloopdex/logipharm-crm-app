import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';
import 'services/contacts.repository.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key, this.contact});
  final Contact? contact;

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _categorie = '1';
  final _nom = TextEditingController();
  final _prenom = TextEditingController();
  final _wilayaId = TextEditingController();
  final _regionLib = TextEditingController();
  final _vilId = TextEditingController();
  final _delegueId = TextEditingController();
  final _ville = TextEditingController();
  final _adresse = TextEditingController();
  final _email = TextEditingController();
  final _tel1 = TextEditingController();
  final _tel2 = TextEditingController();

  // Pharmacien
  final _rcCode = TextEditingController();
  final _fiscalCode = TextEditingController();
  final _nis = TextEditingController();
  final _articleCode = TextEditingController();

  // Medecin
  final _specialite = TextEditingController();
  final _potentiel = TextEditingController();
  String? _connaissanceProduit;
  String? _prescripteur;
  final _objections = TextEditingController();

  @override
  void initState() {
    super.initState();
    final c = widget.contact;
    if (c != null) {
      _categorie = c.categorie ?? '1';
      _nom.text = c.nom ?? '';
      _prenom.text = c.prenom ?? '';
      _wilayaId.text = c.wilayaId ?? '';
      _regionLib.text = c.regionLib ?? '';
      _vilId.text = c.vilId ?? '';
      _delegueId.text = c.delegueId?.toString() ?? '';
      _ville.text = c.ville ?? '';
      _adresse.text = c.adresse ?? '';
      _email.text = c.email ?? '';
      _tel1.text = c.tel1 ?? '';
      _tel2.text = c.tel2 ?? '';
      _rcCode.text = c.rcCode ?? '';
      _fiscalCode.text = c.fiscalCode ?? '';
      _nis.text = c.nis ?? '';
      _articleCode.text = c.articleCode ?? '';
      _specialite.text = c.specialite ?? '';
      _potentiel.text = c.potentiel ?? '';
      _connaissanceProduit = c.connaissanceProduit;
      _prescripteur = c.prescripteur;
      _objections.text = c.objections ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact == null
            ? context.i10n.contactsAdd
            : context.i10n.contactsEdit),
        actions: [
          if (widget.contact != null)
            IconButton(
              onPressed: () async {
                final id = widget.contact!.id!;
                final r = await ContactsRepository.remove(id);
                if (r.statusCode == 200) {
                  if (mounted) Navigator.of(context).pop();
                } else {
                  context.errorSnackBar(r.data.toString());
                }
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(kPaddingMd2),
          children: [
            _Section(
              title: context.i10n.contactsGeneralInfo,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _categorie,
                    decoration: InputDecoration(
                        labelText: context.i10n.contactsCategorie),
                    items: [
                      DropdownMenuItem(
                          value: '1',
                          child: Text(context.i10n.contactsPharmacien)),
                      DropdownMenuItem(
                          value: '2',
                          child: Text(context.i10n.contactsMedecin)),
                      DropdownMenuItem(
                          value: '3',
                          child: Text(context.i10n.contactsPatient)),
                    ],
                    onChanged: (v) => setState(() => _categorie = v ?? '1'),
                  ),
                  TextFormField(
                      controller: _nom,
                      decoration: InputDecoration(labelText: context.i10n.name),
                      validator: _req),
                  TextFormField(
                      controller: _prenom,
                      decoration:
                          InputDecoration(labelText: context.i10n.firstName)),
                ],
              ),
            ),
            _Section(
              title: context.i10n.contactsContactInfo,
              child: Column(
                children: [
                  TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: 'email')),
                  TextFormField(
                      controller: _tel1,
                      decoration: const InputDecoration(labelText: 'tel1')),
                  TextFormField(
                      controller: _tel2,
                      decoration: const InputDecoration(labelText: 'tel2')),
                  TextFormField(
                      controller: _adresse,
                      decoration:
                          InputDecoration(labelText: context.i10n.address)),
                  TextFormField(
                      controller: _ville,
                      decoration:
                          InputDecoration(labelText: context.i10n.city)),
                ],
              ),
            ),
            _Section(
              title: 'Région',
              child: Column(
                children: [
                  TextFormField(
                      controller: _wilayaId,
                      decoration: const InputDecoration(labelText: 'wilayaId'),
                      validator: _req),
                  TextFormField(
                      controller: _regionLib,
                      decoration:
                          const InputDecoration(labelText: 'regionLib')),
                  TextFormField(
                      controller: _vilId,
                      decoration: const InputDecoration(labelText: 'vilId')),
                  TextFormField(
                      controller: _delegueId,
                      decoration: const InputDecoration(labelText: 'delegueId'),
                      keyboardType: TextInputType.number),
                ],
              ),
            ),
            if (_categorie == '1')
              _Section(
                title: context.i10n.contactsPharmacienDetails,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _rcCode,
                        decoration: const InputDecoration(labelText: 'rcCode')),
                    TextFormField(
                        controller: _fiscalCode,
                        decoration:
                            const InputDecoration(labelText: 'fiscalCode')),
                    TextFormField(
                        controller: _nis,
                        decoration: const InputDecoration(labelText: 'nis')),
                    TextFormField(
                        controller: _articleCode,
                        decoration:
                            const InputDecoration(labelText: 'articleCode')),
                  ],
                ),
              ),
            if (_categorie == '2')
              _Section(
                title: context.i10n.contactsMedecinDetails,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _specialite,
                        decoration:
                            const InputDecoration(labelText: 'specialite')),
                    TextFormField(
                        controller: _potentiel,
                        decoration:
                            const InputDecoration(labelText: 'potentiel')),
                    DropdownButtonFormField<String>(
                      value: _connaissanceProduit,
                      decoration: const InputDecoration(
                          labelText: 'connaissanceProduit'),
                      items: const [
                        DropdownMenuItem(value: 'OUI', child: Text('OUI')),
                        DropdownMenuItem(value: 'NON', child: Text('NON')),
                      ],
                      onChanged: (v) =>
                          setState(() => _connaissanceProduit = v),
                    ),
                    DropdownButtonFormField<String>(
                      value: _prescripteur,
                      decoration:
                          const InputDecoration(labelText: 'prescripteur'),
                      items: const [
                        DropdownMenuItem(value: 'OUI', child: Text('OUI')),
                        DropdownMenuItem(value: 'NON', child: Text('NON')),
                      ],
                      onChanged: (v) => setState(() => _prescripteur = v),
                    ),
                    TextFormField(
                        controller: _objections,
                        decoration:
                            const InputDecoration(labelText: 'objections')),
                  ],
                ),
              ),
            SizedBox(height: kSpacingX4),
            ElevatedButton(
              onPressed: _submit,
              child: Text(widget.contact == null
                  ? context.i10n.add
                  : context.i10n.update),
            ),
          ],
        ),
      ),
    );
  }

  String? _req(String? v) =>
      (v == null || v.isEmpty) ? context.i10n.fieldIsRequired : null;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final payload = ContactCreateUpdate(
      categorie: _categorie,
      nom: _nom.text,
      prenom: _prenom.text.isEmpty ? null : _prenom.text,
      wilayaId: _wilayaId.text,
      regionLib: _regionLib.text.isEmpty ? null : _regionLib.text,
      vilId: _vilId.text.isEmpty ? null : _vilId.text,
      delegueId: _delegueId.text.isEmpty ? null : int.tryParse(_delegueId.text),
      ville: _ville.text.isEmpty ? null : _ville.text,
      adresse: _adresse.text.isEmpty ? null : _adresse.text,
      email: _email.text.isEmpty ? null : _email.text,
      tel1: _tel1.text.isEmpty ? null : _tel1.text,
      tel2: _tel2.text.isEmpty ? null : _tel2.text,
      rcCode: _rcCode.text.isEmpty ? null : _rcCode.text,
      fiscalCode: _fiscalCode.text.isEmpty ? null : _fiscalCode.text,
      nis: _nis.text.isEmpty ? null : _nis.text,
      articleCode: _articleCode.text.isEmpty ? null : _articleCode.text,
      specialite: _specialite.text.isEmpty ? null : _specialite.text,
      potentiel: _potentiel.text.isEmpty ? null : _potentiel.text,
      connaissanceProduit: _connaissanceProduit,
      prescripteur: _prescripteur,
      objections: _objections.text.isEmpty ? null : _objections.text,
    ).toJson();

    if (widget.contact == null) {
      final r = await ContactsRepository.create(payload);
      if (r.statusCode == 201 || r.statusCode == 200) {
        if (mounted) Navigator.of(context).pop();
      } else {
        context.errorSnackBar(r.data.toString());
      }
    } else {
      final r = await ContactsRepository.update(widget.contact!.id!, payload);
      if (r.statusCode == 200) {
        if (mounted) Navigator.of(context).pop();
      } else {
        context.errorSnackBar(r.data.toString());
      }
    }
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

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
            child: child,
          ),
        ],
      ),
    );
  }
}
