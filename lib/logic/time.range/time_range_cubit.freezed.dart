// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_range_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeRangeState {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime? get validatedStartDate => throw _privateConstructorUsedError;
  DateTime? get validatedEndDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime endDate,
            DateTime? validatedStartDate, DateTime? validatedEndDate)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime endDate,
            DateTime? validatedStartDate, DateTime? validatedEndDate)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime endDate,
            DateTime? validatedStartDate, DateTime? validatedEndDate)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TimeRangeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeRangeStateCopyWith<TimeRangeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeStateCopyWith<$Res> {
  factory $TimeRangeStateCopyWith(
          TimeRangeState value, $Res Function(TimeRangeState) then) =
      _$TimeRangeStateCopyWithImpl<$Res, TimeRangeState>;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      DateTime? validatedStartDate,
      DateTime? validatedEndDate});
}

/// @nodoc
class _$TimeRangeStateCopyWithImpl<$Res, $Val extends TimeRangeState>
    implements $TimeRangeStateCopyWith<$Res> {
  _$TimeRangeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeRangeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? validatedStartDate = freezed,
    Object? validatedEndDate = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validatedStartDate: freezed == validatedStartDate
          ? _value.validatedStartDate
          : validatedStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validatedEndDate: freezed == validatedEndDate
          ? _value.validatedEndDate
          : validatedEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TimeRangeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      DateTime? validatedStartDate,
      DateTime? validatedEndDate});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TimeRangeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeRangeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? validatedStartDate = freezed,
    Object? validatedEndDate = freezed,
  }) {
    return _then(_$InitialImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validatedStartDate: freezed == validatedStartDate
          ? _value.validatedStartDate
          : validatedStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validatedEndDate: freezed == validatedEndDate
          ? _value.validatedEndDate
          : validatedEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.startDate,
      required this.endDate,
      this.validatedStartDate,
      this.validatedEndDate});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateTime? validatedStartDate;
  @override
  final DateTime? validatedEndDate;

  @override
  String toString() {
    return 'TimeRangeState.initial(startDate: $startDate, endDate: $endDate, validatedStartDate: $validatedStartDate, validatedEndDate: $validatedEndDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.validatedStartDate, validatedStartDate) ||
                other.validatedStartDate == validatedStartDate) &&
            (identical(other.validatedEndDate, validatedEndDate) ||
                other.validatedEndDate == validatedEndDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, startDate, endDate, validatedStartDate, validatedEndDate);

  /// Create a copy of TimeRangeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime endDate,
            DateTime? validatedStartDate, DateTime? validatedEndDate)
        initial,
  }) {
    return initial(startDate, endDate, validatedStartDate, validatedEndDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime endDate,
            DateTime? validatedStartDate, DateTime? validatedEndDate)?
        initial,
  }) {
    return initial?.call(
        startDate, endDate, validatedStartDate, validatedEndDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime endDate,
            DateTime? validatedStartDate, DateTime? validatedEndDate)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(startDate, endDate, validatedStartDate, validatedEndDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TimeRangeState {
  const factory _Initial(
      {required final DateTime startDate,
      required final DateTime endDate,
      final DateTime? validatedStartDate,
      final DateTime? validatedEndDate}) = _$InitialImpl;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  DateTime? get validatedStartDate;
  @override
  DateTime? get validatedEndDate;

  /// Create a copy of TimeRangeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
