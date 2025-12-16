// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Claim _$ClaimFromJson(Map<String, dynamic> json) {
  return _Claim.fromJson(json);
}

/// @nodoc
mixin _$Claim {
  @JsonKey(name: 'pharmacieId')
  int get pharmacieId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'titre')
  String get titre => throw _privateConstructorUsedError;
  @JsonKey(name: 'motif')
  String get motif => throw _privateConstructorUsedError;
  @JsonKey(name: 'rapport')
  String get rapport => throw _privateConstructorUsedError;
  @JsonKey(name: 'rapportText')
  String get rapportText => throw _privateConstructorUsedError;

  /// Serializes this Claim to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimCopyWith<Claim> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimCopyWith<$Res> {
  factory $ClaimCopyWith(Claim value, $Res Function(Claim) then) =
      _$ClaimCopyWithImpl<$Res, Claim>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pharmacieId') int pharmacieId,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'type') int type,
      @JsonKey(name: 'titre') String titre,
      @JsonKey(name: 'motif') String motif,
      @JsonKey(name: 'rapport') String rapport,
      @JsonKey(name: 'rapportText') String rapportText});
}

/// @nodoc
class _$ClaimCopyWithImpl<$Res, $Val extends Claim>
    implements $ClaimCopyWith<$Res> {
  _$ClaimCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmacieId = null,
    Object? date = null,
    Object? type = null,
    Object? titre = null,
    Object? motif = null,
    Object? rapport = null,
    Object? rapportText = null,
  }) {
    return _then(_value.copyWith(
      pharmacieId: null == pharmacieId
          ? _value.pharmacieId
          : pharmacieId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      titre: null == titre
          ? _value.titre
          : titre // ignore: cast_nullable_to_non_nullable
              as String,
      motif: null == motif
          ? _value.motif
          : motif // ignore: cast_nullable_to_non_nullable
              as String,
      rapport: null == rapport
          ? _value.rapport
          : rapport // ignore: cast_nullable_to_non_nullable
              as String,
      rapportText: null == rapportText
          ? _value.rapportText
          : rapportText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimImplCopyWith<$Res> implements $ClaimCopyWith<$Res> {
  factory _$$ClaimImplCopyWith(
          _$ClaimImpl value, $Res Function(_$ClaimImpl) then) =
      __$$ClaimImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pharmacieId') int pharmacieId,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'type') int type,
      @JsonKey(name: 'titre') String titre,
      @JsonKey(name: 'motif') String motif,
      @JsonKey(name: 'rapport') String rapport,
      @JsonKey(name: 'rapportText') String rapportText});
}

/// @nodoc
class __$$ClaimImplCopyWithImpl<$Res>
    extends _$ClaimCopyWithImpl<$Res, _$ClaimImpl>
    implements _$$ClaimImplCopyWith<$Res> {
  __$$ClaimImplCopyWithImpl(
      _$ClaimImpl _value, $Res Function(_$ClaimImpl) _then)
      : super(_value, _then);

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmacieId = null,
    Object? date = null,
    Object? type = null,
    Object? titre = null,
    Object? motif = null,
    Object? rapport = null,
    Object? rapportText = null,
  }) {
    return _then(_$ClaimImpl(
      pharmacieId: null == pharmacieId
          ? _value.pharmacieId
          : pharmacieId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      titre: null == titre
          ? _value.titre
          : titre // ignore: cast_nullable_to_non_nullable
              as String,
      motif: null == motif
          ? _value.motif
          : motif // ignore: cast_nullable_to_non_nullable
              as String,
      rapport: null == rapport
          ? _value.rapport
          : rapport // ignore: cast_nullable_to_non_nullable
              as String,
      rapportText: null == rapportText
          ? _value.rapportText
          : rapportText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimImpl implements _Claim {
  const _$ClaimImpl(
      {@JsonKey(name: 'pharmacieId') required this.pharmacieId,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'titre') required this.titre,
      @JsonKey(name: 'motif') required this.motif,
      @JsonKey(name: 'rapport') required this.rapport,
      @JsonKey(name: 'rapportText') required this.rapportText});

  factory _$ClaimImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimImplFromJson(json);

  @override
  @JsonKey(name: 'pharmacieId')
  final int pharmacieId;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'type')
  final int type;
  @override
  @JsonKey(name: 'titre')
  final String titre;
  @override
  @JsonKey(name: 'motif')
  final String motif;
  @override
  @JsonKey(name: 'rapport')
  final String rapport;
  @override
  @JsonKey(name: 'rapportText')
  final String rapportText;

  @override
  String toString() {
    return 'Claim(pharmacieId: $pharmacieId, date: $date, type: $type, titre: $titre, motif: $motif, rapport: $rapport, rapportText: $rapportText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimImpl &&
            (identical(other.pharmacieId, pharmacieId) ||
                other.pharmacieId == pharmacieId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.rapport, rapport) || other.rapport == rapport) &&
            (identical(other.rapportText, rapportText) ||
                other.rapportText == rapportText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pharmacieId, date, type, titre, motif, rapport, rapportText);

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimImplCopyWith<_$ClaimImpl> get copyWith =>
      __$$ClaimImplCopyWithImpl<_$ClaimImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimImplToJson(
      this,
    );
  }
}

abstract class _Claim implements Claim {
  const factory _Claim(
          {@JsonKey(name: 'pharmacieId') required final int pharmacieId,
          @JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'type') required final int type,
          @JsonKey(name: 'titre') required final String titre,
          @JsonKey(name: 'motif') required final String motif,
          @JsonKey(name: 'rapport') required final String rapport,
          @JsonKey(name: 'rapportText') required final String rapportText}) =
      _$ClaimImpl;

  factory _Claim.fromJson(Map<String, dynamic> json) = _$ClaimImpl.fromJson;

  @override
  @JsonKey(name: 'pharmacieId')
  int get pharmacieId;
  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'type')
  int get type;
  @override
  @JsonKey(name: 'titre')
  String get titre;
  @override
  @JsonKey(name: 'motif')
  String get motif;
  @override
  @JsonKey(name: 'rapport')
  String get rapport;
  @override
  @JsonKey(name: 'rapportText')
  String get rapportText;

  /// Create a copy of Claim
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimImplCopyWith<_$ClaimImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
