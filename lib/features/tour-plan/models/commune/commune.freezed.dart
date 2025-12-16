// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commune.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Commune _$CommuneFromJson(Map<String, dynamic> json) {
  return _Commune.fromJson(json);
}

/// @nodoc
mixin _$Commune {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'wlyCode')
  String get wlyCode => throw _privateConstructorUsedError;

  /// Serializes this Commune to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Commune
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommuneCopyWith<Commune> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommuneCopyWith<$Res> {
  factory $CommuneCopyWith(Commune value, $Res Function(Commune) then) =
      _$CommuneCopyWithImpl<$Res, Commune>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'nom') String name,
      @JsonKey(name: 'wlyCode') String wlyCode});
}

/// @nodoc
class _$CommuneCopyWithImpl<$Res, $Val extends Commune>
    implements $CommuneCopyWith<$Res> {
  _$CommuneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Commune
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? wlyCode = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      wlyCode: null == wlyCode
          ? _value.wlyCode
          : wlyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommuneImplCopyWith<$Res> implements $CommuneCopyWith<$Res> {
  factory _$$CommuneImplCopyWith(
          _$CommuneImpl value, $Res Function(_$CommuneImpl) then) =
      __$$CommuneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'nom') String name,
      @JsonKey(name: 'wlyCode') String wlyCode});
}

/// @nodoc
class __$$CommuneImplCopyWithImpl<$Res>
    extends _$CommuneCopyWithImpl<$Res, _$CommuneImpl>
    implements _$$CommuneImplCopyWith<$Res> {
  __$$CommuneImplCopyWithImpl(
      _$CommuneImpl _value, $Res Function(_$CommuneImpl) _then)
      : super(_value, _then);

  /// Create a copy of Commune
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? wlyCode = null,
  }) {
    return _then(_$CommuneImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      wlyCode: null == wlyCode
          ? _value.wlyCode
          : wlyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommuneImpl implements _Commune {
  const _$CommuneImpl(
      {@JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'nom') required this.name,
      @JsonKey(name: 'wlyCode') required this.wlyCode});

  factory _$CommuneImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommuneImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'nom')
  final String name;
  @override
  @JsonKey(name: 'wlyCode')
  final String wlyCode;

  @override
  String toString() {
    return 'Commune(code: $code, name: $name, wlyCode: $wlyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommuneImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.wlyCode, wlyCode) || other.wlyCode == wlyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, wlyCode);

  /// Create a copy of Commune
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommuneImplCopyWith<_$CommuneImpl> get copyWith =>
      __$$CommuneImplCopyWithImpl<_$CommuneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommuneImplToJson(
      this,
    );
  }
}

abstract class _Commune implements Commune {
  const factory _Commune(
      {@JsonKey(name: 'code') required final String code,
      @JsonKey(name: 'nom') required final String name,
      @JsonKey(name: 'wlyCode') required final String wlyCode}) = _$CommuneImpl;

  factory _Commune.fromJson(Map<String, dynamic> json) = _$CommuneImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'nom')
  String get name;
  @override
  @JsonKey(name: 'wlyCode')
  String get wlyCode;

  /// Create a copy of Commune
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommuneImplCopyWith<_$CommuneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
