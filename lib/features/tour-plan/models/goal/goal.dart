// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    @JsonKey(name: 'numberVisit') required num visitNumber,
    @JsonKey(name: 'dateVisit') required String date,
    @JsonKey(name: 'paramObjectiveVisit') required num objective,
    @JsonKey(name: 'percentageObjectiveVisit') required num percentageObjective,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}
