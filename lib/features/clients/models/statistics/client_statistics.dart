// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_statistics.freezed.dart';
part 'client_statistics.g.dart';

@freezed
class ClientReclamation with _$ClientReclamation {
  const factory ClientReclamation({
    @JsonKey(name: 'statutLigne') required String status,
    @JsonKey(name: 'number') required int number,
  }) = _ClientReclamation;

  factory ClientReclamation.fromJson(Map<String, dynamic> json) =>
      _$ClientReclamationFromJson(json);
}

@freezed
class ClientStatistics with _$ClientStatistics {
  const factory ClientStatistics({
    @JsonKey(name: 'companyId') required num? companyId,
    @JsonKey(name: 'clientId') required num? clientId,
    @JsonKey(name: 'blocageCommercial') required bool? commercialBlockage,
    @JsonKey(name: 'blocageFinancier') required bool? financialBlockage,
    @JsonKey(name: 'totalHt') required num? totalHt,
    @JsonKey(name: 'totalTtc') required num? totalTtc,
    @JsonKey(name: 'plafond') required num? ceiling,
    @JsonKey(name: 'totalReste') required num? totalRest,
    @JsonKey(name: 'totalReglement') required num? totalPayment,
    @JsonKey(name: 'reclamations') required List<ClientReclamation> clientReclamations,
  }) = _ClientStatistics;

  factory ClientStatistics.fromJson(Map<String, dynamic> json) => _$ClientStatisticsFromJson(json);
}
