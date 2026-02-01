// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fournisseur_lov.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FournisseurLov _$FournisseurLovFromJson(Map<String, dynamic> json) {
  return _FournisseurLov.fromJson(json);
}

/// @nodoc
mixin _$FournisseurLov {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;

  /// Serializes this FournisseurLov to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FournisseurLov
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FournisseurLovCopyWith<FournisseurLov> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FournisseurLovCopyWith<$Res> {
  factory $FournisseurLovCopyWith(
          FournisseurLov value, $Res Function(FournisseurLov) then) =
      _$FournisseurLovCopyWithImpl<$Res, FournisseurLov>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class _$FournisseurLovCopyWithImpl<$Res, $Val extends FournisseurLov>
    implements $FournisseurLovCopyWith<$Res> {
  _$FournisseurLovCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FournisseurLov
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
abstract class _$$FournisseurLovImplCopyWith<$Res>
    implements $FournisseurLovCopyWith<$Res> {
  factory _$$FournisseurLovImplCopyWith(_$FournisseurLovImpl value,
          $Res Function(_$FournisseurLovImpl) then) =
      __$$FournisseurLovImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class __$$FournisseurLovImplCopyWithImpl<$Res>
    extends _$FournisseurLovCopyWithImpl<$Res, _$FournisseurLovImpl>
    implements _$$FournisseurLovImplCopyWith<$Res> {
  __$$FournisseurLovImplCopyWithImpl(
      _$FournisseurLovImpl _value, $Res Function(_$FournisseurLovImpl) _then)
      : super(_value, _then);

  /// Create a copy of FournisseurLov
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$FournisseurLovImpl(
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
class _$FournisseurLovImpl implements _FournisseurLov {
  const _$FournisseurLovImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'label') required this.label});

  factory _$FournisseurLovImpl.fromJson(Map<String, dynamic> json) =>
      _$$FournisseurLovImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'label')
  final String label;

  @override
  String toString() {
    return 'FournisseurLov(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FournisseurLovImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  /// Create a copy of FournisseurLov
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FournisseurLovImplCopyWith<_$FournisseurLovImpl> get copyWith =>
      __$$FournisseurLovImplCopyWithImpl<_$FournisseurLovImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FournisseurLovImplToJson(
      this,
    );
  }
}

abstract class _FournisseurLov implements FournisseurLov {
  const factory _FournisseurLov(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'label') required final String label}) =
      _$FournisseurLovImpl;

  factory _FournisseurLov.fromJson(Map<String, dynamic> json) =
      _$FournisseurLovImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'label')
  String get label;

  /// Create a copy of FournisseurLov
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FournisseurLovImplCopyWith<_$FournisseurLovImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
