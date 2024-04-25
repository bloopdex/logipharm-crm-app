// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hire.freezed.dart';
part 'hire.g.dart';

@freezed
class Hire with _$Hire {
  const factory Hire({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'companyId') required int companyId,
    @JsonKey(name: 'delegueId') required int delegateId,
    @JsonKey(name: 'delegueType') required String delegateType,
    @JsonKey(name: 'nom') String? lastName,
    @JsonKey(name: 'prenom') String? firstName,
    @JsonKey(name: 'regionId') required String regionId,
    @JsonKey(name: 'regionName') required String regionName,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'telephone') String? telephone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'statusFlag') required int statusFlag,
    @JsonKey(name: 'statusName') required String statusName,
    @JsonKey(name: 'remarque') String? remark,
  }) = _Hire;

  factory Hire.fromJson(Map<String, dynamic> json) => _$HireFromJson(json);
}
