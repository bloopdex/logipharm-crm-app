// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turnover.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Turnover _$TurnoverFromJson(Map<String, dynamic> json) {
  return _Turnover.fromJson(json);
}

/// @nodoc
mixin _$Turnover {
  @JsonKey(name: 'year')
  num get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
  num get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'turnover')
  num get turnover => throw _privateConstructorUsedError;

  /// Serializes this Turnover to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Turnover
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TurnoverCopyWith<Turnover> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoverCopyWith<$Res> {
  factory $TurnoverCopyWith(Turnover value, $Res Function(Turnover) then) =
      _$TurnoverCopyWithImpl<$Res, Turnover>;
  @useResult
  $Res call(
      {@JsonKey(name: 'year') num year,
      @JsonKey(name: 'month') num month,
      @JsonKey(name: 'turnover') num turnover});
}

/// @nodoc
class _$TurnoverCopyWithImpl<$Res, $Val extends Turnover>
    implements $TurnoverCopyWith<$Res> {
  _$TurnoverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Turnover
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? turnover = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as num,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as num,
      turnover: null == turnover
          ? _value.turnover
          : turnover // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnoverImplCopyWith<$Res>
    implements $TurnoverCopyWith<$Res> {
  factory _$$TurnoverImplCopyWith(
          _$TurnoverImpl value, $Res Function(_$TurnoverImpl) then) =
      __$$TurnoverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'year') num year,
      @JsonKey(name: 'month') num month,
      @JsonKey(name: 'turnover') num turnover});
}

/// @nodoc
class __$$TurnoverImplCopyWithImpl<$Res>
    extends _$TurnoverCopyWithImpl<$Res, _$TurnoverImpl>
    implements _$$TurnoverImplCopyWith<$Res> {
  __$$TurnoverImplCopyWithImpl(
      _$TurnoverImpl _value, $Res Function(_$TurnoverImpl) _then)
      : super(_value, _then);

  /// Create a copy of Turnover
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? turnover = null,
  }) {
    return _then(_$TurnoverImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as num,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as num,
      turnover: null == turnover
          ? _value.turnover
          : turnover // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnoverImpl implements _Turnover {
  const _$TurnoverImpl(
      {@JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'month') required this.month,
      @JsonKey(name: 'turnover') required this.turnover});

  factory _$TurnoverImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoverImplFromJson(json);

  @override
  @JsonKey(name: 'year')
  final num year;
  @override
  @JsonKey(name: 'month')
  final num month;
  @override
  @JsonKey(name: 'turnover')
  final num turnover;

  @override
  String toString() {
    return 'Turnover(year: $year, month: $month, turnover: $turnover)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnoverImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.turnover, turnover) ||
                other.turnover == turnover));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, turnover);

  /// Create a copy of Turnover
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoverImplCopyWith<_$TurnoverImpl> get copyWith =>
      __$$TurnoverImplCopyWithImpl<_$TurnoverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoverImplToJson(
      this,
    );
  }
}

abstract class _Turnover implements Turnover {
  const factory _Turnover(
      {@JsonKey(name: 'year') required final num year,
      @JsonKey(name: 'month') required final num month,
      @JsonKey(name: 'turnover') required final num turnover}) = _$TurnoverImpl;

  factory _Turnover.fromJson(Map<String, dynamic> json) =
      _$TurnoverImpl.fromJson;

  @override
  @JsonKey(name: 'year')
  num get year;
  @override
  @JsonKey(name: 'month')
  num get month;
  @override
  @JsonKey(name: 'turnover')
  num get turnover;

  /// Create a copy of Turnover
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TurnoverImplCopyWith<_$TurnoverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
