// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'commercial_register.freezed.dart';
part 'commercial_register.g.dart';

@freezed
class CommercialRegister with _$CommercialRegister {
  const factory CommercialRegister({
    @JsonKey(name: 'commercialRegisterNumber') required String commercialRegisterNumber,
    @JsonKey(name: 'region') required String region,
    @JsonKey(name: 'lastName') required String lastName,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'adress') required String address,
    @JsonKey(name: 'stateWilaya') required String stateWilaya,
    @JsonKey(name: 'mnuicipality') required String municipality,
    @JsonKey(name: 'commercialRegisterStatus') required String commercialRegisterStatus,
  }) = _CommercialRegister;

  factory CommercialRegister.fromJson(Map<String, dynamic> json) =>
      _$CommercialRegisterFromJson(json);
}
