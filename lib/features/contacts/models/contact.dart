// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

/// categorie: "1" Pharmacien, "2" Médecin, "3" Patient
@freezed
class Contact with _$Contact {
  const factory Contact({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'categorie') String? categorie,
    @JsonKey(name: 'nom') String? nom,
    @JsonKey(name: 'prenom') String? prenom,
    @JsonKey(name: 'wilayaId') String? wilayaId,
    @JsonKey(name: 'regionLib') String? regionLib,
    @JsonKey(name: 'vilId') String? vilId,
    @JsonKey(name: 'delegueId') int? delegueId,
    @JsonKey(name: 'ville') String? ville,
    @JsonKey(name: 'adresse') String? adresse,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'tel1') String? tel1,
    @JsonKey(name: 'tel2') String? tel2,

    // Pharmacien extras
    @JsonKey(name: 'rcCode') String? rcCode,
    @JsonKey(name: 'fiscalCode') String? fiscalCode,
    @JsonKey(name: 'nis') String? nis,
    @JsonKey(name: 'articleCode') String? articleCode,

    // Médecin extras
    @JsonKey(name: 'specialite') String? specialite,
    @JsonKey(name: 'potentiel') String? potentiel,
    @JsonKey(name: 'connaissanceProduit') String? connaissanceProduit,
    @JsonKey(name: 'prescripteur') String? prescripteur,
    @JsonKey(name: 'objections') String? objections,

    // Patient extras (new)
    @JsonKey(name: 'medecinTraitant') String? medecinTraitant,
    @JsonKey(name: 'specialiteMedecin') String? specialiteMedecin,
    @JsonKey(name: 'typeDiabete') String? typeDiabete,
    @JsonKey(name: 'testeProduit') String? testeProduit,
    @JsonKey(name: 'resultatTest') String? resultatTest,

    // Inactive flag
    @JsonKey(name: 'inactifFlag') bool? inactifFlag,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

@freezed
class ContactCreateUpdate with _$ContactCreateUpdate {
  const factory ContactCreateUpdate({
    @JsonKey(name: 'categorie') required String categorie,
    @JsonKey(name: 'nom') required String nom,
    @JsonKey(name: 'prenom') String? prenom,
    @JsonKey(name: 'wilayaId') required String wilayaId,
    @JsonKey(name: 'regionLib') String? regionLib,
    @JsonKey(name: 'vilId') String? vilId,
    @JsonKey(name: 'delegueId') int? delegueId,
    @JsonKey(name: 'ville') String? ville,
    @JsonKey(name: 'adresse') String? adresse,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'tel1') String? tel1,
    @JsonKey(name: 'tel2') String? tel2,

    // Pharmacien extras
    @JsonKey(name: 'rcCode') String? rcCode,
    @JsonKey(name: 'fiscalCode') String? fiscalCode,
    @JsonKey(name: 'nis') String? nis,
    @JsonKey(name: 'articleCode') String? articleCode,

    // Médecin extras
    @JsonKey(name: 'specialite') String? specialite,
    @JsonKey(name: 'potentiel') String? potentiel,
    @JsonKey(name: 'connaissanceProduit') String? connaissanceProduit,
    @JsonKey(name: 'prescripteur') String? prescripteur,
    @JsonKey(name: 'objections') String? objections,

    // Patient extras (new)
    @JsonKey(name: 'medecinTraitant') String? medecinTraitant,
    @JsonKey(name: 'specialiteMedecin') String? specialiteMedecin,
    @JsonKey(name: 'typeDiabete') String? typeDiabete,
    @JsonKey(name: 'testeProduit') String? testeProduit,
    @JsonKey(name: 'resultatTest') String? resultatTest,
  }) = _ContactCreateUpdate;

  factory ContactCreateUpdate.fromJson(Map<String, dynamic> json) =>
      _$ContactCreateUpdateFromJson(json);
}
