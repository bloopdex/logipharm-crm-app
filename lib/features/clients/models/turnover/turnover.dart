import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'turnover.freezed.dart';
part 'turnover.g.dart';

const uuid = Uuid();

@freezed
class Turnover with _$Turnover {
  const factory Turnover({
    @JsonKey(name: 'year') required num year,
    @JsonKey(name: 'month') required num month,
    @JsonKey(name: 'turnover') required num turnover,
  }) = _Turnover;

  factory Turnover.fromJson(Map<String, dynamic> json) => _$TurnoverFromJson(json);
}
