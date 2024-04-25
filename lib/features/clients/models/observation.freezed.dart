// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'observation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Observation _$ObservationFromJson(Map<String, dynamic> json) {
  return _Observation.fromJson(json);
}

/// @nodoc
mixin _$Observation {
  @JsonKey(name: 'pharmacieId')
  int get pharmacyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'titre')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'motif')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'rapport')
  String get report => throw _privateConstructorUsedError;
  @JsonKey(name: 'rapportText')
  String get reportText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationCopyWith<Observation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationCopyWith<$Res> {
  factory $ObservationCopyWith(
          Observation value, $Res Function(Observation) then) =
      _$ObservationCopyWithImpl<$Res, Observation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pharmacieId') int pharmacyId,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'type') int type,
      @JsonKey(name: 'titre') String title,
      @JsonKey(name: 'motif') String? reason,
      @JsonKey(name: 'rapport') String report,
      @JsonKey(name: 'rapportText') String reportText});
}

/// @nodoc
class _$ObservationCopyWithImpl<$Res, $Val extends Observation>
    implements $ObservationCopyWith<$Res> {
  _$ObservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmacyId = null,
    Object? date = null,
    Object? type = null,
    Object? title = null,
    Object? reason = freezed,
    Object? report = null,
    Object? reportText = null,
  }) {
    return _then(_value.copyWith(
      pharmacyId: null == pharmacyId
          ? _value.pharmacyId
          : pharmacyId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String,
      reportText: null == reportText
          ? _value.reportText
          : reportText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObservationImplCopyWith<$Res>
    implements $ObservationCopyWith<$Res> {
  factory _$$ObservationImplCopyWith(
          _$ObservationImpl value, $Res Function(_$ObservationImpl) then) =
      __$$ObservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pharmacieId') int pharmacyId,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'type') int type,
      @JsonKey(name: 'titre') String title,
      @JsonKey(name: 'motif') String? reason,
      @JsonKey(name: 'rapport') String report,
      @JsonKey(name: 'rapportText') String reportText});
}

/// @nodoc
class __$$ObservationImplCopyWithImpl<$Res>
    extends _$ObservationCopyWithImpl<$Res, _$ObservationImpl>
    implements _$$ObservationImplCopyWith<$Res> {
  __$$ObservationImplCopyWithImpl(
      _$ObservationImpl _value, $Res Function(_$ObservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmacyId = null,
    Object? date = null,
    Object? type = null,
    Object? title = null,
    Object? reason = freezed,
    Object? report = null,
    Object? reportText = null,
  }) {
    return _then(_$ObservationImpl(
      pharmacyId: null == pharmacyId
          ? _value.pharmacyId
          : pharmacyId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String,
      reportText: null == reportText
          ? _value.reportText
          : reportText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationImpl implements _Observation {
  const _$ObservationImpl(
      {@JsonKey(name: 'pharmacieId') required this.pharmacyId,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'titre') required this.title,
      @JsonKey(name: 'motif') this.reason,
      @JsonKey(name: 'rapport') required this.report,
      @JsonKey(name: 'rapportText') required this.reportText});

  factory _$ObservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationImplFromJson(json);

  @override
  @JsonKey(name: 'pharmacieId')
  final int pharmacyId;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'type')
  final int type;
  @override
  @JsonKey(name: 'titre')
  final String title;
  @override
  @JsonKey(name: 'motif')
  final String? reason;
  @override
  @JsonKey(name: 'rapport')
  final String report;
  @override
  @JsonKey(name: 'rapportText')
  final String reportText;

  @override
  String toString() {
    return 'Observation(pharmacyId: $pharmacyId, date: $date, type: $type, title: $title, reason: $reason, report: $report, reportText: $reportText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationImpl &&
            (identical(other.pharmacyId, pharmacyId) ||
                other.pharmacyId == pharmacyId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.reportText, reportText) ||
                other.reportText == reportText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pharmacyId, date, type, title, reason, report, reportText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationImplCopyWith<_$ObservationImpl> get copyWith =>
      __$$ObservationImplCopyWithImpl<_$ObservationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationImplToJson(
      this,
    );
  }
}

abstract class _Observation implements Observation {
  const factory _Observation(
          {@JsonKey(name: 'pharmacieId') required final int pharmacyId,
          @JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'type') required final int type,
          @JsonKey(name: 'titre') required final String title,
          @JsonKey(name: 'motif') final String? reason,
          @JsonKey(name: 'rapport') required final String report,
          @JsonKey(name: 'rapportText') required final String reportText}) =
      _$ObservationImpl;

  factory _Observation.fromJson(Map<String, dynamic> json) =
      _$ObservationImpl.fromJson;

  @override
  @JsonKey(name: 'pharmacieId')
  int get pharmacyId;
  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'type')
  int get type;
  @override
  @JsonKey(name: 'titre')
  String get title;
  @override
  @JsonKey(name: 'motif')
  String? get reason;
  @override
  @JsonKey(name: 'rapport')
  String get report;
  @override
  @JsonKey(name: 'rapportText')
  String get reportText;
  @override
  @JsonKey(ignore: true)
  _$$ObservationImplCopyWith<_$ObservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
