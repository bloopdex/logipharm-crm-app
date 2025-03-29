// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalImpl _$$GoalImplFromJson(Map<String, dynamic> json) => _$GoalImpl(
      visitNumber: json['numberVisit'] as num,
      date: json['dateVisit'] as String,
      objective: json['paramObjectiveVisit'] as num,
      percentageObjective: json['percentageObjectiveVisit'] as num,
    );

Map<String, dynamic> _$$GoalImplToJson(_$GoalImpl instance) =>
    <String, dynamic>{
      'numberVisit': instance.visitNumber,
      'dateVisit': instance.date,
      'paramObjectiveVisit': instance.objective,
      'percentageObjectiveVisit': instance.percentageObjective,
    };
