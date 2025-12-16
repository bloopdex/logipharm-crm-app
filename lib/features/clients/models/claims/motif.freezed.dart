// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motif.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClaimMotif _$ClaimMotifFromJson(Map<String, dynamic> json) {
  return _ClaimMotif.fromJson(json);
}

/// @nodoc
mixin _$ClaimMotif {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;

  /// Serializes this ClaimMotif to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClaimMotif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimMotifCopyWith<ClaimMotif> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimMotifCopyWith<$Res> {
  factory $ClaimMotifCopyWith(
          ClaimMotif value, $Res Function(ClaimMotif) then) =
      _$ClaimMotifCopyWithImpl<$Res, ClaimMotif>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class _$ClaimMotifCopyWithImpl<$Res, $Val extends ClaimMotif>
    implements $ClaimMotifCopyWith<$Res> {
  _$ClaimMotifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClaimMotif
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
abstract class _$$ClaimMotifImplCopyWith<$Res>
    implements $ClaimMotifCopyWith<$Res> {
  factory _$$ClaimMotifImplCopyWith(
          _$ClaimMotifImpl value, $Res Function(_$ClaimMotifImpl) then) =
      __$$ClaimMotifImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class __$$ClaimMotifImplCopyWithImpl<$Res>
    extends _$ClaimMotifCopyWithImpl<$Res, _$ClaimMotifImpl>
    implements _$$ClaimMotifImplCopyWith<$Res> {
  __$$ClaimMotifImplCopyWithImpl(
      _$ClaimMotifImpl _value, $Res Function(_$ClaimMotifImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClaimMotif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$ClaimMotifImpl(
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
class _$ClaimMotifImpl implements _ClaimMotif {
  const _$ClaimMotifImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'label') required this.label});

  factory _$ClaimMotifImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimMotifImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'label')
  final String label;

  @override
  String toString() {
    return 'ClaimMotif(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimMotifImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  /// Create a copy of ClaimMotif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimMotifImplCopyWith<_$ClaimMotifImpl> get copyWith =>
      __$$ClaimMotifImplCopyWithImpl<_$ClaimMotifImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimMotifImplToJson(
      this,
    );
  }
}

abstract class _ClaimMotif implements ClaimMotif {
  const factory _ClaimMotif(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'label') required final String label}) = _$ClaimMotifImpl;

  factory _ClaimMotif.fromJson(Map<String, dynamic> json) =
      _$ClaimMotifImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'label')
  String get label;

  /// Create a copy of ClaimMotif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimMotifImplCopyWith<_$ClaimMotifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
