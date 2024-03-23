// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/person/person.dart';

part 'tour.freezed.dart';
part 'tour.g.dart';

@freezed
class Tour with _$Tour {
  const factory Tour({
    @JsonKey(name: 'tourneeId') required String tourneeId,
    @JsonKey(name: 'companyId') required int companyId,
    @JsonKey(name: 'regionId') String? regionId,
    @JsonKey(name: 'regionName') required String regionName,
    @JsonKey(name: 'dateDebut') required String startDate,
    @JsonKey(name: 'dateFin') required String endDate,
    @JsonKey(name: 'statusFlag') required int statusFlag,
    @JsonKey(name: 'dateDebutEffective') String? effectiveStartDate,
    @JsonKey(name: 'dateFinEffective') String? effectiveEndDate,
    @JsonKey(name: 'delegue') required Person delegate,
    @JsonKey(name: 'superviseur') required Person supervisor,
    @JsonKey(name: 'tourneeDetails') required List<TourDetail> tourDetails,
  }) = _Tour;

  factory Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);
}

@freezed
class TourDetail with _$TourDetail {
  const factory TourDetail({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'tourneMaitreId') required String masterTourId,
    @JsonKey(name: 'companyId') required int companyId,
    @JsonKey(name: 'regionId') String? regionId,
    @JsonKey(name: 'dateDebut') String? startDate,
    @JsonKey(name: 'dateFin') String? endDate,
    @JsonKey(name: 'statusFlag') int? statusFlag,
    @JsonKey(name: 'motif') String? reason,
    @JsonKey(name: 'repport') String? report,
    @JsonKey(name: 'pharmacie') Person? pharmacy,
  }) = _TourDetail;

  factory TourDetail.fromJson(Map<String, dynamic> json) =>
      _$TourDetailFromJson(json);
}
