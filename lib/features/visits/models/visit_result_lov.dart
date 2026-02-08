import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_result_lov.freezed.dart';
part 'visit_result_lov.g.dart';

@freezed
class VisitResultLov with _$VisitResultLov {
  const factory VisitResultLov({
    required int id,
    required String label,
  }) = _VisitResultLov;

  factory VisitResultLov.fromJson(Map<String, dynamic> json) =>
      _$VisitResultLovFromJson(json);
}
