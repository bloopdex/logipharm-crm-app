// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wilaya.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wilaya _$WilayaFromJson(Map<String, dynamic> json) {
  return _Wilaya.fromJson(json);
}

/// @nodoc
mixin _$Wilaya {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'zone')
  String get zone => throw _privateConstructorUsedError;

  /// Serializes this Wilaya to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Wilaya
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WilayaCopyWith<Wilaya> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WilayaCopyWith<$Res> {
  factory $WilayaCopyWith(Wilaya value, $Res Function(Wilaya) then) =
      _$WilayaCopyWithImpl<$Res, Wilaya>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'nom') String name,
      @JsonKey(name: 'zone') String zone});
}

/// @nodoc
class _$WilayaCopyWithImpl<$Res, $Val extends Wilaya>
    implements $WilayaCopyWith<$Res> {
  _$WilayaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Wilaya
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? zone = null,
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
      zone: null == zone
          ? _value.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WilayaImplCopyWith<$Res> implements $WilayaCopyWith<$Res> {
  factory _$$WilayaImplCopyWith(
          _$WilayaImpl value, $Res Function(_$WilayaImpl) then) =
      __$$WilayaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'nom') String name,
      @JsonKey(name: 'zone') String zone});
}

/// @nodoc
class __$$WilayaImplCopyWithImpl<$Res>
    extends _$WilayaCopyWithImpl<$Res, _$WilayaImpl>
    implements _$$WilayaImplCopyWith<$Res> {
  __$$WilayaImplCopyWithImpl(
      _$WilayaImpl _value, $Res Function(_$WilayaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Wilaya
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? zone = null,
  }) {
    return _then(_$WilayaImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      zone: null == zone
          ? _value.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WilayaImpl implements _Wilaya {
  const _$WilayaImpl(
      {@JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'nom') required this.name,
      @JsonKey(name: 'zone') required this.zone});

  factory _$WilayaImpl.fromJson(Map<String, dynamic> json) =>
      _$$WilayaImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'nom')
  final String name;
  @override
  @JsonKey(name: 'zone')
  final String zone;

  @override
  String toString() {
    return 'Wilaya(code: $code, name: $name, zone: $zone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WilayaImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.zone, zone) || other.zone == zone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, zone);

  /// Create a copy of Wilaya
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WilayaImplCopyWith<_$WilayaImpl> get copyWith =>
      __$$WilayaImplCopyWithImpl<_$WilayaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WilayaImplToJson(
      this,
    );
  }
}

abstract class _Wilaya implements Wilaya {
  const factory _Wilaya(
      {@JsonKey(name: 'code') required final String code,
      @JsonKey(name: 'nom') required final String name,
      @JsonKey(name: 'zone') required final String zone}) = _$WilayaImpl;

  factory _Wilaya.fromJson(Map<String, dynamic> json) = _$WilayaImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'nom')
  String get name;
  @override
  @JsonKey(name: 'zone')
  String get zone;

  /// Create a copy of Wilaya
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WilayaImplCopyWith<_$WilayaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
