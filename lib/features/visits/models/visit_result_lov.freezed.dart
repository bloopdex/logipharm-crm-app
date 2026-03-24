// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_result_lov.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VisitResultLov _$VisitResultLovFromJson(Map<String, dynamic> json) {
  return _VisitResultLov.fromJson(json);
}

/// @nodoc
mixin _$VisitResultLov {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this VisitResultLov to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitResultLov
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitResultLovCopyWith<VisitResultLov> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitResultLovCopyWith<$Res> {
  factory $VisitResultLovCopyWith(
          VisitResultLov value, $Res Function(VisitResultLov) then) =
      _$VisitResultLovCopyWithImpl<$Res, VisitResultLov>;
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class _$VisitResultLovCopyWithImpl<$Res, $Val extends VisitResultLov>
    implements $VisitResultLovCopyWith<$Res> {
  _$VisitResultLovCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitResultLov
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitResultLovImplCopyWith<$Res>
    implements $VisitResultLovCopyWith<$Res> {
  factory _$$VisitResultLovImplCopyWith(_$VisitResultLovImpl value,
          $Res Function(_$VisitResultLovImpl) then) =
      __$$VisitResultLovImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class __$$VisitResultLovImplCopyWithImpl<$Res>
    extends _$VisitResultLovCopyWithImpl<$Res, _$VisitResultLovImpl>
    implements _$$VisitResultLovImplCopyWith<$Res> {
  __$$VisitResultLovImplCopyWithImpl(
      _$VisitResultLovImpl _value, $Res Function(_$VisitResultLovImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitResultLov
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$VisitResultLovImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitResultLovImpl implements _VisitResultLov {
  const _$VisitResultLovImpl({required this.id, required this.label});

  factory _$VisitResultLovImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitResultLovImplFromJson(json);

  @override
  final int id;
  @override
  final String label;

  @override
  String toString() {
    return 'VisitResultLov(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitResultLovImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  /// Create a copy of VisitResultLov
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitResultLovImplCopyWith<_$VisitResultLovImpl> get copyWith =>
      __$$VisitResultLovImplCopyWithImpl<_$VisitResultLovImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitResultLovImplToJson(
      this,
    );
  }
}

abstract class _VisitResultLov implements VisitResultLov {
  const factory _VisitResultLov(
      {required final int id,
      required final String label}) = _$VisitResultLovImpl;

  factory _VisitResultLov.fromJson(Map<String, dynamic> json) =
      _$VisitResultLovImpl.fromJson;

  @override
  int get id;
  @override
  String get label;

  /// Create a copy of VisitResultLov
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitResultLovImplCopyWith<_$VisitResultLovImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
