// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motif_visit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MotifVisit _$MotifVisitFromJson(Map<String, dynamic> json) {
  return _MotifVisit.fromJson(json);
}

/// @nodoc
mixin _$MotifVisit {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String? get label => throw _privateConstructorUsedError;

  /// Serializes this MotifVisit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MotifVisit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotifVisitCopyWith<MotifVisit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotifVisitCopyWith<$Res> {
  factory $MotifVisitCopyWith(
          MotifVisit value, $Res Function(MotifVisit) then) =
      _$MotifVisitCopyWithImpl<$Res, MotifVisit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String? label});
}

/// @nodoc
class _$MotifVisitCopyWithImpl<$Res, $Val extends MotifVisit>
    implements $MotifVisitCopyWith<$Res> {
  _$MotifVisitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MotifVisit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotifVisitImplCopyWith<$Res>
    implements $MotifVisitCopyWith<$Res> {
  factory _$$MotifVisitImplCopyWith(
          _$MotifVisitImpl value, $Res Function(_$MotifVisitImpl) then) =
      __$$MotifVisitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String? label});
}

/// @nodoc
class __$$MotifVisitImplCopyWithImpl<$Res>
    extends _$MotifVisitCopyWithImpl<$Res, _$MotifVisitImpl>
    implements _$$MotifVisitImplCopyWith<$Res> {
  __$$MotifVisitImplCopyWithImpl(
      _$MotifVisitImpl _value, $Res Function(_$MotifVisitImpl) _then)
      : super(_value, _then);

  /// Create a copy of MotifVisit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = freezed,
  }) {
    return _then(_$MotifVisitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MotifVisitImpl implements _MotifVisit {
  const _$MotifVisitImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'label') required this.label});

  factory _$MotifVisitImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotifVisitImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'label')
  final String? label;

  @override
  String toString() {
    return 'MotifVisit(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotifVisitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  /// Create a copy of MotifVisit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotifVisitImplCopyWith<_$MotifVisitImpl> get copyWith =>
      __$$MotifVisitImplCopyWithImpl<_$MotifVisitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotifVisitImplToJson(
      this,
    );
  }
}

abstract class _MotifVisit implements MotifVisit {
  const factory _MotifVisit(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'label') required final String? label}) = _$MotifVisitImpl;

  factory _MotifVisit.fromJson(Map<String, dynamic> json) =
      _$MotifVisitImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'label')
  String? get label;

  /// Create a copy of MotifVisit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotifVisitImplCopyWith<_$MotifVisitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
