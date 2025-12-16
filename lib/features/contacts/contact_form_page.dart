import 'package:crm/core/core.dart';
import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/contact.dart';
import 'services/contacts.repository.dart';
import 'bloc/specialite_lov_cubit.dart';
import '../../logic/auth/auth_bloc.dart';
import '../tour-plan/bloc/wilaya_cubit.dart';
import '../tour-plan/bloc/commune_cubit.dart';
import '../tour-plan/models/wilaya/wilaya.dart';
import '../tour-plan/models/commune/commune.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key, this.contact});
  final Contact? contact;

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _stepKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  int _currentStep = 0;
  String _categorie = '1';
  final _nom = TextEditingController();
  final _prenom = TextEditingController();
  final _wilayaId = TextEditingController();
  final _regionLib = TextEditingController();
  final _vilId = TextEditingController();
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

  // Médecin
  final _specialite = TextEditingController();
  final _potentiel = TextEditingController();
  String? _connaissanceProduit;
  String? _prescripteur;
  bool _promessePrescription = false;

  // Patient
  final _medecinTraitant = TextEditingController();
  final _specialiteMedecin = TextEditingController();
  final _typeDiabete = TextEditingController();
  String? _patientConnaissanceProduit;
  String? _testeProduit;
  final _resultatTest = TextEditingController();

  // Shared
  final _objections = TextEditingController();

  String _selectedWilayaId = '';
  String _selectedCommuneId = '';
  bool _hasConnaissanceProduit = false;
  bool _isPrescripteur = false;
  bool _patientHasConnaissanceProduit = false;
  bool _patientTesteProduit = false;

  String _categoryStepTitle(BuildContext context) {
    return _categorie == '1'
        ? context.i10n.contactsPharmacien
        : _categorie == '2'
            ? context.i10n.contactsMedecin
            : context.i10n.contactsPatient;
  }

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
      _medecinTraitant.text = c.medecinTraitant ?? '';
      _specialiteMedecin.text = c.specialiteMedecin ?? '';
      _typeDiabete.text = c.typeDiabete ?? '';
      _patientConnaissanceProduit = c.connaissanceProduit;
      _testeProduit = c.testeProduit;
      _resultatTest.text = c.resultatTest ?? '';
    }

    _selectedWilayaId = _wilayaId.text;
    _selectedCommuneId = _vilId.text;
    _hasConnaissanceProduit =
        (_connaissanceProduit ?? '').toUpperCase() == 'OUI';
    _isPrescripteur = (_prescripteur ?? '').toUpperCase() == 'OUI';
    _patientHasConnaissanceProduit =
        (_patientConnaissanceProduit ?? '').toUpperCase() == 'OUI';
    _patientTesteProduit = (_testeProduit ?? '').toUpperCase() == 'OUI';

    final wilayaCubit = context.read<WilayaCubit?>();
    if (wilayaCubit != null && wilayaCubit.state.isEmpty) wilayaCubit.load();
    final communeCubit = context.read<CommuneCubit?>();
    if (communeCubit != null && communeCubit.state.isEmpty) communeCubit.load();
    final specialiteLovCubit = context.read<SpecialiteLovCubit?>();
    specialiteLovCubit?.load();
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
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (i) => setState(() => _currentStep = i),
        onStepCancel: () {
          if (_currentStep > 0) setState(() => _currentStep -= 1);
        },
        onStepContinue: () {
          final isLast = _currentStep == 2;
          final valid =
              _stepKeys[_currentStep].currentState?.validate() ?? true;
          if (!valid) return;
          if (isLast) {
            _submit();
          } else {
            setState(() => _currentStep += 1);
          }
        },
        controlsBuilder: (context, details) {
          final isLast = _currentStep == 2;
          return Padding(
            padding: EdgeInsets.only(top: kSpacingX2),
            child: Row(
              children: [
                Expanded(
                  child: isLast
                      ? CustomButton(
                          onPressed: details.onStepContinue,
                          text: widget.contact == null
                              ? context.i10n.add
                              : context.i10n.update,
                        )
                      : FilledButton(
                          onPressed: details.onStepContinue,
                          child: const Text('Next'),
                        ),
                ),
                SizedBox(width: kSpacingX2),
                if (_currentStep > 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Back'),
                  ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: Text(context.i10n.contactsGeneralInfo),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            content: Form(
              key: _stepKeys[0],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FieldLabel(label: 'Catégorie', requiredField: true),
                  Row(
                    children: [
                      Expanded(
                        child: _CategoryTile(
                          icon: Icons.local_pharmacy_outlined,
                          label: context.i10n.contactsPharmacien,
                          selected: _categorie == '1',
                          onTap: () => setState(() => _categorie = '1'),
                        ),
                      ),
                      SizedBox(width: kSpacingX2),
                      Expanded(
                        child: _CategoryTile(
                          icon: Icons.medical_information_outlined,
                          label: context.i10n.contactsMedecin,
                          selected: _categorie == '2',
                          onTap: () => setState(() => _categorie = '2'),
                        ),
                      ),
                      SizedBox(width: kSpacingX2),
                      Expanded(
                        child: _CategoryTile(
                          icon: Icons.person_outline,
                          label: context.i10n.contactsPatient,
                          selected: _categorie == '3',
                          onTap: () => setState(() => _categorie = '3'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingX3),
                  _FieldLabel(
                      label: context.i10n.lastName, requiredField: true),
                  TextFormField(
                    controller: _nom,
                    decoration: InputDecoration(
                        hintText: context.i10n.lastNamePlaceholder),
                    validator: _req,
                  ),
                  SizedBox(height: kSpacingX2),
                  _FieldLabel(
                      label: context.i10n.firstName, requiredField: true),
                  TextFormField(
                    controller: _prenom,
                    decoration: InputDecoration(
                        hintText: context.i10n.firstNamePlaceholder),
                    validator: _req,
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: Text(context.i10n.contactsContactInfo),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            content: Form(
              key: _stepKeys[1],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FieldLabel(label: 'Email'),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: context.i10n.email),
                    validator: (v) {
                      if (v == null || v.isEmpty) return null;
                      final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
                      return emailRegex.hasMatch(v)
                          ? null
                          : context.i10n.emailInvalid;
                    },
                  ),
                  SizedBox(height: kSpacingX2),
                  _FieldLabel(label: context.i10n.phone1, requiredField: true),
                  TextFormField(
                    controller: _tel1,
                    decoration: InputDecoration(hintText: context.i10n.phone1),
                    validator: _req,
                  ),
                  SizedBox(height: kSpacingX2),
                  _FieldLabel(label: context.i10n.phone2),
                  TextFormField(
                    controller: _tel2,
                    decoration: InputDecoration(hintText: context.i10n.phone2),
                  ),
                  SizedBox(height: kSpacingX2),
                  _FieldLabel(label: context.i10n.address, requiredField: true),
                  TextFormField(
                    controller: _adresse,
                    decoration: InputDecoration(hintText: context.i10n.address),
                    validator: _req,
                  ),
                  SizedBox(height: kSpacingX2),
                  _FieldLabel(
                      label: context.i10n.contactRegionLib,
                      requiredField: true),
                  BlocBuilder<WilayaCubit, List<Wilaya>>(
                    builder: (context, state) {
                      return DropdownButtonFormField<String>(
                        value: _selectedWilayaId.isEmpty
                            ? null
                            : _selectedWilayaId,
                        decoration: InputDecoration(
                            hintText: context.i10n.contactRegionLibHint),
                        items: state
                            .map((w) => DropdownMenuItem<String>(
                                  value: w.code,
                                  child: Text(w.name,
                                      overflow: TextOverflow.ellipsis),
                                ))
                            .toList(),
                        validator: (v) => (v == null || v.isEmpty)
                            ? context.i10n.fieldIsRequired
                            : null,
                        onChanged: (value) {
                          setState(() {
                            _selectedWilayaId = value ?? '';
                            _wilayaId.text = _selectedWilayaId;
                            final selected = state.firstWhere(
                              (e) => e.code == _selectedWilayaId,
                              orElse: () =>
                                  const Wilaya(code: '', name: '', zone: ''),
                            );
                            _regionLib.text = selected.name;
                            _selectedCommuneId = '';
                            _vilId.clear();
                            _ville.clear();
                          });
                        },
                      );
                    },
                  ),
                  SizedBox(height: kSpacingX2),
                  _FieldLabel(label: context.i10n.city, requiredField: true),
                  BlocBuilder<CommuneCubit, List<Commune>>(
                    builder: (context, state) {
                      final communes = state
                          .where((c) => _selectedWilayaId.isEmpty
                              ? true
                              : c.wlyCode == _selectedWilayaId)
                          .toList();
                      return DropdownButtonFormField<String>(
                        value: _selectedCommuneId.isEmpty
                            ? null
                            : _selectedCommuneId,
                        decoration:
                            InputDecoration(hintText: context.i10n.cityHint),
                        items: communes
                            .map((c) => DropdownMenuItem<String>(
                                  value: c.code,
                                  child: Text(c.name,
                                      overflow: TextOverflow.ellipsis),
                                ))
                            .toList(),
                        validator: (v) => (v == null || v.isEmpty)
                            ? context.i10n.fieldIsRequired
                            : null,
                        onChanged: (value) {
                          setState(() {
                            _selectedCommuneId = value ?? '';
                            _vilId.text = _selectedCommuneId;
                            final selected = communes.firstWhere(
                              (e) => e.code == _selectedCommuneId,
                              orElse: () => const Commune(
                                  code: '', name: '', wlyCode: ''),
                            );
                            _ville.text = selected.name;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: Text(_categoryStepTitle(context)),
            isActive: _currentStep >= 2,
            state: StepState.indexed,
            content: Form(
              key: _stepKeys[2],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_categorie == '1') ...[
                    _FieldLabel(
                        label: context.i10n.contactRcCode, requiredField: true),
                    TextFormField(
                      controller: _rcCode,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactRcCodeHint),
                      validator: _req,
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(
                        label: context.i10n.contactFiscalCode,
                        requiredField: true),
                    TextFormField(
                      controller: _fiscalCode,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactFiscalCodeHint),
                      validator: _req,
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(
                        label: context.i10n.contactNis, requiredField: true),
                    TextFormField(
                      controller: _nis,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactNisHint),
                      validator: _req,
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(
                        label: context.i10n.contactArticleCode,
                        requiredField: true),
                    TextFormField(
                      controller: _articleCode,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactArticleCodeHint),
                      validator: _req,
                    ),
                  ] else if (_categorie == '2') ...[
                    _FieldLabel(
                        label: context.i10n.contactSpecialite,
                        requiredField: true),
                    BlocBuilder<SpecialiteLovCubit, SpecialiteLovState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (_) => TextFormField(
                            controller: _specialite,
                            decoration: InputDecoration(
                                hintText: context.i10n.contactSpecialiteHint),
                            validator: _req,
                          ),
                          loaded: (items) {
                            return DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: _specialite.text.isEmpty
                                  ? null
                                  : _specialite.text,
                              decoration: InputDecoration(
                                  hintText: context.i10n.contactSpecialiteHint),
                              items: items
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.label,
                                        child: Text(e.label),
                                      ))
                                  .toList(),
                              onChanged: (v) {
                                setState(() =>
                                    _specialite.text = v?.toString() ?? '');
                              },
                              validator: (v) => (v == null)
                                  ? context.i10n.fieldIsRequired
                                  : null,
                            );
                          },
                          orElse: () => TextFormField(
                            controller: _specialite,
                            decoration: InputDecoration(
                                hintText: context.i10n.contactSpecialiteHint),
                            validator: _req,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(
                        label: context.i10n.contactPotentiel,
                        requiredField: true),
                    DropdownButtonFormField<String>(
                      value: (_potentiel.text.isEmpty ? null : _potentiel.text),
                      decoration: InputDecoration(
                          hintText: context.i10n.contactPotentielHint),
                      items: const [
                        DropdownMenuItem(value: 'A', child: Text('A')),
                        DropdownMenuItem(value: 'B', child: Text('B')),
                        DropdownMenuItem(value: 'C', child: Text('C')),
                      ],
                      onChanged: (v) =>
                          setState(() => _potentiel.text = v ?? ''),
                      validator: (v) => (v == null || v.isEmpty)
                          ? context.i10n.fieldIsRequired
                          : null,
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(label: context.i10n.contactConnaissanceProduit),
                    CheckboxListTile(
                      value: _hasConnaissanceProduit,
                      onChanged: (v) =>
                          setState(() => _hasConnaissanceProduit = v ?? false),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(context.i10n.contactConnaissanceProduit),
                      contentPadding: EdgeInsets.zero,
                    ),
                    if (_hasConnaissanceProduit) ...[
                      SizedBox(height: kSpacingX2),
                      const _FieldLabel(label: 'Prescripteur'),
                      CheckboxListTile(
                        value: _isPrescripteur,
                        onChanged: (v) =>
                            setState(() => _isPrescripteur = v ?? false),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(context.i10n.contactPrescripteur),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                    SizedBox(height: kSpacingX2),
                    Builder(builder: (context) {
                      final showPromesse =
                          !_hasConnaissanceProduit || !_isPrescripteur;
                      if (!showPromesse) return const SizedBox.shrink();
                      return FormField<bool>(
                        validator: (_) => _promessePrescription
                            ? null
                            : context.i10n.fieldIsRequired,
                        builder: (ffState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckboxListTile(
                                value: _promessePrescription,
                                onChanged: (v) {
                                  setState(
                                      () => _promessePrescription = v ?? false);
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(context
                                    .i10n.visitFieldPromessePrescription),
                                contentPadding: EdgeInsets.zero,
                              ),
                              if (ffState.hasError)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: kSpacingX1, top: kSpacingX1),
                                  child: Text(ffState.errorText ?? '',
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(color: kCardinal)),
                                ),
                            ],
                          );
                        },
                      );
                    }),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(label: context.i10n.contactObjections),
                    TextFormField(
                      controller: _objections,
                      minLines: 2,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: context.i10n.contactObjectionsHint,
                      ),
                    ),
                  ] else ...[
                    _FieldLabel(
                        label: context.i10n.contactMedecinTraitant,
                        requiredField: true),
                    TextFormField(
                      controller: _medecinTraitant,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactMedecinTraitantHint),
                      validator: _req,
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(
                        label: context.i10n.contactSpecialiteMedecin,
                        requiredField: true),
                    BlocBuilder<SpecialiteLovCubit, SpecialiteLovState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (_) => TextFormField(
                            controller: _specialiteMedecin,
                            decoration: InputDecoration(
                                hintText:
                                    context.i10n.contactSpecialiteMedecinHint),
                            validator: _req,
                          ),
                          loaded: (items) {
                            return DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: _specialiteMedecin.text.isEmpty
                                  ? null
                                  : _specialiteMedecin.text,
                              decoration: InputDecoration(
                                  hintText: context
                                      .i10n.contactSpecialiteMedecinHint),
                              items: items
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.label,
                                        child: Text(e.label),
                                      ))
                                  .toList(),
                              onChanged: (v) {
                                setState(() => _specialiteMedecin.text =
                                    v?.toString() ?? '');
                              },
                              validator: (v) => (v == null)
                                  ? context.i10n.fieldIsRequired
                                  : null,
                            );
                          },
                          orElse: () => TextFormField(
                            controller: _specialiteMedecin,
                            decoration: InputDecoration(
                                hintText:
                                    context.i10n.contactSpecialiteMedecinHint),
                            validator: _req,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(
                        label: context.i10n.contactTypeDiabete,
                        requiredField: true),
                    DropdownButtonFormField<String>(
                      value:
                          _typeDiabete.text.isEmpty ? null : _typeDiabete.text,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactTypeDiabeteHint),
                      items: const [
                        DropdownMenuItem(
                            value: 'Type 1', child: Text('Type 1')),
                        DropdownMenuItem(
                            value: 'Type 2', child: Text('Type 2')),
                      ],
                      validator: _req,
                      onChanged: (v) =>
                          setState(() => _typeDiabete.text = v ?? ''),
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(
                        label: context.i10n.contactPatientConnaissanceProduit),
                    CheckboxListTile(
                      value: _patientHasConnaissanceProduit,
                      onChanged: (v) => setState(
                          () => _patientHasConnaissanceProduit = v ?? false),
                      controlAffinity: ListTileControlAffinity.leading,
                      title:
                          Text(context.i10n.contactPatientConnaissanceProduit),
                      contentPadding: EdgeInsets.zero,
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(label: context.i10n.contactTesteProduit),
                    CheckboxListTile(
                      value: _patientTesteProduit,
                      onChanged: (v) =>
                          setState(() => _patientTesteProduit = v ?? false),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(context.i10n.contactTesteProduit),
                      contentPadding: EdgeInsets.zero,
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(label: context.i10n.contactResultatTest),
                    TextFormField(
                      controller: _resultatTest,
                      minLines: 2,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactResultatTestHint),
                    ),
                    SizedBox(height: kSpacingX2),
                    _FieldLabel(label: context.i10n.contactObjections),
                    TextFormField(
                      controller: _objections,
                      minLines: 2,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: context.i10n.contactObjectionsHint),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _req(String? v) =>
      (v == null || v.isEmpty) ? context.i10n.fieldIsRequired : null;

  Future<void> _submit() async {
    for (final key in _stepKeys) {
      final ok = key.currentState?.validate() ?? true;
      if (!ok) return;
    }
    final connaissanceVal = _categorie == '3'
        ? (_patientHasConnaissanceProduit ? 'OUI' : 'NON')
        : (_hasConnaissanceProduit ? 'OUI' : 'NON');
    final String? prescripteurVal = _categorie == '2'
        ? (_hasConnaissanceProduit ? (_isPrescripteur ? 'OUI' : 'NON') : 'NON')
        : null;

    final needPromesse =
        _categorie == '2' && (!_hasConnaissanceProduit || !_isPrescripteur);
    final objectionsVal = _objections.text.isEmpty ? null : _objections.text;

    final payload = ContactCreateUpdate(
      categorie: _categorie,
      nom: _nom.text,
      prenom: _prenom.text.isEmpty ? null : _prenom.text,
      wilayaId: _wilayaId.text,
      regionLib: _regionLib.text.isEmpty ? null : _regionLib.text,
      vilId: _vilId.text.isEmpty ? null : _vilId.text,
      delegueId: context.read<AuthBloc>().user.id,
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
      connaissanceProduit: connaissanceVal,
      prescripteur: prescripteurVal,
      objections: objectionsVal,
      medecinTraitant: _categorie == '3' && _medecinTraitant.text.isNotEmpty
          ? _medecinTraitant.text
          : null,
      specialiteMedecin: _categorie == '3' && _specialiteMedecin.text.isNotEmpty
          ? _specialiteMedecin.text
          : null,
      typeDiabete: _categorie == '3' && _typeDiabete.text.isNotEmpty
          ? _typeDiabete.text
          : null,
      testeProduit:
          _categorie == '3' ? (_patientTesteProduit ? 'OUI' : 'NON') : null,
      resultatTest: _categorie == '3' && _resultatTest.text.isNotEmpty
          ? _resultatTest.text
          : null,
    ).toJson();

    if (needPromesse) {
      payload['promessePrescription'] = _promessePrescription ? 'OUI' : 'NON';
    }

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

class _FieldLabel extends StatelessWidget {
  final String label;
  final bool requiredField;
  const _FieldLabel({required this.label, this.requiredField = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: kSpacingX1),
      child: RichText(
        text: TextSpan(
          style: context.textTheme.labelLarge?.copyWith(color: kText1),
          children: [
            TextSpan(text: label),
            if (requiredField)
              TextSpan(
                  text: ' *',
                  style:
                      context.textTheme.labelLarge?.copyWith(color: kCardinal)),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _CategoryTile(
      {required this.icon,
      required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color border = selected ? kCeruleanBlue : kBorder3;
    final Color bg = selected ? kCeruleanBlue.withOpacity(0.08) : kWhite;
    final Color iconColor = selected ? kCeruleanBlue : kText2;
    final Color textColor = selected ? kCeruleanBlue : kText1;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kSpacingX3),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kPaddingSm3),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(kSpacingX3),
          border: Border.all(color: border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: iconColor),
            SizedBox(height: kSpacingX1),
            Text(label,
                style:
                    context.textTheme.bodyMedium?.copyWith(color: textColor)),
          ],
        ),
      ),
    );
  }
}
