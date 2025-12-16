// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'realization.freezed.dart';
part 'realization.g.dart';

@freezed
class DelegateRealization with _$DelegateRealization {
  const factory DelegateRealization({
    @JsonKey(name: 'companyId') required int companyId,
    @JsonKey(name: 'year') required int year,
    @JsonKey(name: 'month') required int month,
    @JsonKey(name: 'delegateId') required int delegateId,
    @JsonKey(name: 'delegateType') required String delegateType,
    @JsonKey(name: 'delegue') required String delegue,
    @JsonKey(name: 'medId') required int medId,
    @JsonKey(name: 'medAmm') required String medAmm,
    @JsonKey(name: 'medCommercialName') required String medCommercialName,
    @JsonKey(name: 'qteObj') int? qteObj,
    @JsonKey(name: 'qteVendue') required int qteVendue,
    @JsonKey(name: 'nbrCde') required int nbrCde,
    @JsonKey(name: 'txReal') required int txReal,
  }) = _DelegateRealization;

  factory DelegateRealization.empty({int? year, int? month}) {
    final now = DateTime.now();
    return DelegateRealization(
      companyId: 0,
      year: year ?? now.year,
      month: month ?? now.month,
      delegateId: 0,
      delegateType: '',
      delegue: '',
      medId: 0,
      medAmm: '',
      medCommercialName: '',
      qteObj: 0,
      qteVendue: 0,
      nbrCde: 0,
      txReal: 0,
    );
  }

  factory DelegateRealization.fromJson(Map<String, dynamic> json) =>
      _$DelegateRealizationFromJson(json);
}
