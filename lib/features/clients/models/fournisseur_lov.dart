import 'package:freezed_annotation/freezed_annotation.dart';

part 'fournisseur_lov.freezed.dart';
part 'fournisseur_lov.g.dart';

@freezed
class FournisseurLov with _$FournisseurLov {
  const factory FournisseurLov({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'label') required String label,
  }) = _FournisseurLov;

  factory FournisseurLov.fromJson(Map<String, dynamic> json) =>
      _$FournisseurLovFromJson(json);
}
