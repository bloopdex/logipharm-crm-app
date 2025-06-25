// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eventvisite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventVisite _$EventVisiteFromJson(Map<String, dynamic> json) {
  return _EventVisite.fromJson(json);
}

/// @nodoc
mixin _$EventVisite {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String? get nom => throw _privateConstructorUsedError;
  @JsonKey(name: 'prenom')
  String? get prenom => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephone')
  String? get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusFlag')
  int? get statusFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarque')
  String? get remarque => throw _privateConstructorUsedError;
  @JsonKey(name: 'att1')
  String? get att1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att2')
  String? get att2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att3')
  String? get att3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att4')
  String? get att4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att5')
  String? get att5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att6')
  int? get att6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att7')
  int? get att7 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att8')
  int? get att8 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att9')
  int? get att9 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att10')
  int? get att10 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att11')
  DateTime? get att11 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att12')
  DateTime? get att12 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att13')
  DateTime? get att13 => throw _privateConstructorUsedError;
  @JsonKey(name: 'att14')
  DateTime? get att14 => throw _privateConstructorUsedError;
  @JsonKey(name: 'creerPar')
  String? get creerPar => throw _privateConstructorUsedError;
  @JsonKey(name: 'creerDate')
  DateTime? get creerDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'evenement')
  Event? get evenement => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegue')
  Person? get delegue => throw _privateConstructorUsedError;

  /// Serializes this EventVisite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventVisite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventVisiteCopyWith<EventVisite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventVisiteCopyWith<$Res> {
  factory $EventVisiteCopyWith(
          EventVisite value, $Res Function(EventVisite) then) =
      _$EventVisiteCopyWithImpl<$Res, EventVisite>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'nom') String? nom,
      @JsonKey(name: 'prenom') String? prenom,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'telephone') String? telephone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'statusFlag') int? statusFlag,
      @JsonKey(name: 'remarque') String? remarque,
      @JsonKey(name: 'att1') String? att1,
      @JsonKey(name: 'att2') String? att2,
      @JsonKey(name: 'att3') String? att3,
      @JsonKey(name: 'att4') String? att4,
      @JsonKey(name: 'att5') String? att5,
      @JsonKey(name: 'att6') int? att6,
      @JsonKey(name: 'att7') int? att7,
      @JsonKey(name: 'att8') int? att8,
      @JsonKey(name: 'att9') int? att9,
      @JsonKey(name: 'att10') int? att10,
      @JsonKey(name: 'att11') DateTime? att11,
      @JsonKey(name: 'att12') DateTime? att12,
      @JsonKey(name: 'att13') DateTime? att13,
      @JsonKey(name: 'att14') DateTime? att14,
      @JsonKey(name: 'creerPar') String? creerPar,
      @JsonKey(name: 'creerDate') DateTime? creerDate,
      @JsonKey(name: 'evenement') Event? evenement,
      @JsonKey(name: 'delegue') Person? delegue});

  $EventCopyWith<$Res>? get evenement;
  $PersonCopyWith<$Res>? get delegue;
}

/// @nodoc
class _$EventVisiteCopyWithImpl<$Res, $Val extends EventVisite>
    implements $EventVisiteCopyWith<$Res> {
  _$EventVisiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventVisite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? address = freezed,
    Object? telephone = freezed,
    Object? email = freezed,
    Object? statusFlag = freezed,
    Object? remarque = freezed,
    Object? att1 = freezed,
    Object? att2 = freezed,
    Object? att3 = freezed,
    Object? att4 = freezed,
    Object? att5 = freezed,
    Object? att6 = freezed,
    Object? att7 = freezed,
    Object? att8 = freezed,
    Object? att9 = freezed,
    Object? att10 = freezed,
    Object? att11 = freezed,
    Object? att12 = freezed,
    Object? att13 = freezed,
    Object? att14 = freezed,
    Object? creerPar = freezed,
    Object? creerDate = freezed,
    Object? evenement = freezed,
    Object? delegue = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: freezed == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
      att1: freezed == att1
          ? _value.att1
          : att1 // ignore: cast_nullable_to_non_nullable
              as String?,
      att2: freezed == att2
          ? _value.att2
          : att2 // ignore: cast_nullable_to_non_nullable
              as String?,
      att3: freezed == att3
          ? _value.att3
          : att3 // ignore: cast_nullable_to_non_nullable
              as String?,
      att4: freezed == att4
          ? _value.att4
          : att4 // ignore: cast_nullable_to_non_nullable
              as String?,
      att5: freezed == att5
          ? _value.att5
          : att5 // ignore: cast_nullable_to_non_nullable
              as String?,
      att6: freezed == att6
          ? _value.att6
          : att6 // ignore: cast_nullable_to_non_nullable
              as int?,
      att7: freezed == att7
          ? _value.att7
          : att7 // ignore: cast_nullable_to_non_nullable
              as int?,
      att8: freezed == att8
          ? _value.att8
          : att8 // ignore: cast_nullable_to_non_nullable
              as int?,
      att9: freezed == att9
          ? _value.att9
          : att9 // ignore: cast_nullable_to_non_nullable
              as int?,
      att10: freezed == att10
          ? _value.att10
          : att10 // ignore: cast_nullable_to_non_nullable
              as int?,
      att11: freezed == att11
          ? _value.att11
          : att11 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      att12: freezed == att12
          ? _value.att12
          : att12 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      att13: freezed == att13
          ? _value.att13
          : att13 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      att14: freezed == att14
          ? _value.att14
          : att14 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      creerPar: freezed == creerPar
          ? _value.creerPar
          : creerPar // ignore: cast_nullable_to_non_nullable
              as String?,
      creerDate: freezed == creerDate
          ? _value.creerDate
          : creerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      evenement: freezed == evenement
          ? _value.evenement
          : evenement // ignore: cast_nullable_to_non_nullable
              as Event?,
      delegue: freezed == delegue
          ? _value.delegue
          : delegue // ignore: cast_nullable_to_non_nullable
              as Person?,
    ) as $Val);
  }

  /// Create a copy of EventVisite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventCopyWith<$Res>? get evenement {
    if (_value.evenement == null) {
      return null;
    }

    return $EventCopyWith<$Res>(_value.evenement!, (value) {
      return _then(_value.copyWith(evenement: value) as $Val);
    });
  }

  /// Create a copy of EventVisite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res>? get delegue {
    if (_value.delegue == null) {
      return null;
    }

    return $PersonCopyWith<$Res>(_value.delegue!, (value) {
      return _then(_value.copyWith(delegue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventVisiteImplCopyWith<$Res>
    implements $EventVisiteCopyWith<$Res> {
  factory _$$EventVisiteImplCopyWith(
          _$EventVisiteImpl value, $Res Function(_$EventVisiteImpl) then) =
      __$$EventVisiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'nom') String? nom,
      @JsonKey(name: 'prenom') String? prenom,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'telephone') String? telephone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'statusFlag') int? statusFlag,
      @JsonKey(name: 'remarque') String? remarque,
      @JsonKey(name: 'att1') String? att1,
      @JsonKey(name: 'att2') String? att2,
      @JsonKey(name: 'att3') String? att3,
      @JsonKey(name: 'att4') String? att4,
      @JsonKey(name: 'att5') String? att5,
      @JsonKey(name: 'att6') int? att6,
      @JsonKey(name: 'att7') int? att7,
      @JsonKey(name: 'att8') int? att8,
      @JsonKey(name: 'att9') int? att9,
      @JsonKey(name: 'att10') int? att10,
      @JsonKey(name: 'att11') DateTime? att11,
      @JsonKey(name: 'att12') DateTime? att12,
      @JsonKey(name: 'att13') DateTime? att13,
      @JsonKey(name: 'att14') DateTime? att14,
      @JsonKey(name: 'creerPar') String? creerPar,
      @JsonKey(name: 'creerDate') DateTime? creerDate,
      @JsonKey(name: 'evenement') Event? evenement,
      @JsonKey(name: 'delegue') Person? delegue});

  @override
  $EventCopyWith<$Res>? get evenement;
  @override
  $PersonCopyWith<$Res>? get delegue;
}

/// @nodoc
class __$$EventVisiteImplCopyWithImpl<$Res>
    extends _$EventVisiteCopyWithImpl<$Res, _$EventVisiteImpl>
    implements _$$EventVisiteImplCopyWith<$Res> {
  __$$EventVisiteImplCopyWithImpl(
      _$EventVisiteImpl _value, $Res Function(_$EventVisiteImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventVisite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? address = freezed,
    Object? telephone = freezed,
    Object? email = freezed,
    Object? statusFlag = freezed,
    Object? remarque = freezed,
    Object? att1 = freezed,
    Object? att2 = freezed,
    Object? att3 = freezed,
    Object? att4 = freezed,
    Object? att5 = freezed,
    Object? att6 = freezed,
    Object? att7 = freezed,
    Object? att8 = freezed,
    Object? att9 = freezed,
    Object? att10 = freezed,
    Object? att11 = freezed,
    Object? att12 = freezed,
    Object? att13 = freezed,
    Object? att14 = freezed,
    Object? creerPar = freezed,
    Object? creerDate = freezed,
    Object? evenement = freezed,
    Object? delegue = freezed,
  }) {
    return _then(_$EventVisiteImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: freezed == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
      att1: freezed == att1
          ? _value.att1
          : att1 // ignore: cast_nullable_to_non_nullable
              as String?,
      att2: freezed == att2
          ? _value.att2
          : att2 // ignore: cast_nullable_to_non_nullable
              as String?,
      att3: freezed == att3
          ? _value.att3
          : att3 // ignore: cast_nullable_to_non_nullable
              as String?,
      att4: freezed == att4
          ? _value.att4
          : att4 // ignore: cast_nullable_to_non_nullable
              as String?,
      att5: freezed == att5
          ? _value.att5
          : att5 // ignore: cast_nullable_to_non_nullable
              as String?,
      att6: freezed == att6
          ? _value.att6
          : att6 // ignore: cast_nullable_to_non_nullable
              as int?,
      att7: freezed == att7
          ? _value.att7
          : att7 // ignore: cast_nullable_to_non_nullable
              as int?,
      att8: freezed == att8
          ? _value.att8
          : att8 // ignore: cast_nullable_to_non_nullable
              as int?,
      att9: freezed == att9
          ? _value.att9
          : att9 // ignore: cast_nullable_to_non_nullable
              as int?,
      att10: freezed == att10
          ? _value.att10
          : att10 // ignore: cast_nullable_to_non_nullable
              as int?,
      att11: freezed == att11
          ? _value.att11
          : att11 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      att12: freezed == att12
          ? _value.att12
          : att12 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      att13: freezed == att13
          ? _value.att13
          : att13 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      att14: freezed == att14
          ? _value.att14
          : att14 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      creerPar: freezed == creerPar
          ? _value.creerPar
          : creerPar // ignore: cast_nullable_to_non_nullable
              as String?,
      creerDate: freezed == creerDate
          ? _value.creerDate
          : creerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      evenement: freezed == evenement
          ? _value.evenement
          : evenement // ignore: cast_nullable_to_non_nullable
              as Event?,
      delegue: freezed == delegue
          ? _value.delegue
          : delegue // ignore: cast_nullable_to_non_nullable
              as Person?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventVisiteImpl implements _EventVisite {
  const _$EventVisiteImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'nom') this.nom,
      @JsonKey(name: 'prenom') this.prenom,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'telephone') this.telephone,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'statusFlag') this.statusFlag,
      @JsonKey(name: 'remarque') this.remarque,
      @JsonKey(name: 'att1') this.att1,
      @JsonKey(name: 'att2') this.att2,
      @JsonKey(name: 'att3') this.att3,
      @JsonKey(name: 'att4') this.att4,
      @JsonKey(name: 'att5') this.att5,
      @JsonKey(name: 'att6') this.att6,
      @JsonKey(name: 'att7') this.att7,
      @JsonKey(name: 'att8') this.att8,
      @JsonKey(name: 'att9') this.att9,
      @JsonKey(name: 'att10') this.att10,
      @JsonKey(name: 'att11') this.att11,
      @JsonKey(name: 'att12') this.att12,
      @JsonKey(name: 'att13') this.att13,
      @JsonKey(name: 'att14') this.att14,
      @JsonKey(name: 'creerPar') this.creerPar,
      @JsonKey(name: 'creerDate') this.creerDate,
      @JsonKey(name: 'evenement') this.evenement,
      @JsonKey(name: 'delegue') this.delegue});

  factory _$EventVisiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventVisiteImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'date')
  final DateTime? date;
  @override
  @JsonKey(name: 'nom')
  final String? nom;
  @override
  @JsonKey(name: 'prenom')
  final String? prenom;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'telephone')
  final String? telephone;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'statusFlag')
  final int? statusFlag;
  @override
  @JsonKey(name: 'remarque')
  final String? remarque;
  @override
  @JsonKey(name: 'att1')
  final String? att1;
  @override
  @JsonKey(name: 'att2')
  final String? att2;
  @override
  @JsonKey(name: 'att3')
  final String? att3;
  @override
  @JsonKey(name: 'att4')
  final String? att4;
  @override
  @JsonKey(name: 'att5')
  final String? att5;
  @override
  @JsonKey(name: 'att6')
  final int? att6;
  @override
  @JsonKey(name: 'att7')
  final int? att7;
  @override
  @JsonKey(name: 'att8')
  final int? att8;
  @override
  @JsonKey(name: 'att9')
  final int? att9;
  @override
  @JsonKey(name: 'att10')
  final int? att10;
  @override
  @JsonKey(name: 'att11')
  final DateTime? att11;
  @override
  @JsonKey(name: 'att12')
  final DateTime? att12;
  @override
  @JsonKey(name: 'att13')
  final DateTime? att13;
  @override
  @JsonKey(name: 'att14')
  final DateTime? att14;
  @override
  @JsonKey(name: 'creerPar')
  final String? creerPar;
  @override
  @JsonKey(name: 'creerDate')
  final DateTime? creerDate;
  @override
  @JsonKey(name: 'evenement')
  final Event? evenement;
  @override
  @JsonKey(name: 'delegue')
  final Person? delegue;

  @override
  String toString() {
    return 'EventVisite(id: $id, date: $date, nom: $nom, prenom: $prenom, address: $address, telephone: $telephone, email: $email, statusFlag: $statusFlag, remarque: $remarque, att1: $att1, att2: $att2, att3: $att3, att4: $att4, att5: $att5, att6: $att6, att7: $att7, att8: $att8, att9: $att9, att10: $att10, att11: $att11, att12: $att12, att13: $att13, att14: $att14, creerPar: $creerPar, creerDate: $creerDate, evenement: $evenement, delegue: $delegue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventVisiteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.statusFlag, statusFlag) ||
                other.statusFlag == statusFlag) &&
            (identical(other.remarque, remarque) ||
                other.remarque == remarque) &&
            (identical(other.att1, att1) || other.att1 == att1) &&
            (identical(other.att2, att2) || other.att2 == att2) &&
            (identical(other.att3, att3) || other.att3 == att3) &&
            (identical(other.att4, att4) || other.att4 == att4) &&
            (identical(other.att5, att5) || other.att5 == att5) &&
            (identical(other.att6, att6) || other.att6 == att6) &&
            (identical(other.att7, att7) || other.att7 == att7) &&
            (identical(other.att8, att8) || other.att8 == att8) &&
            (identical(other.att9, att9) || other.att9 == att9) &&
            (identical(other.att10, att10) || other.att10 == att10) &&
            (identical(other.att11, att11) || other.att11 == att11) &&
            (identical(other.att12, att12) || other.att12 == att12) &&
            (identical(other.att13, att13) || other.att13 == att13) &&
            (identical(other.att14, att14) || other.att14 == att14) &&
            (identical(other.creerPar, creerPar) ||
                other.creerPar == creerPar) &&
            (identical(other.creerDate, creerDate) ||
                other.creerDate == creerDate) &&
            (identical(other.evenement, evenement) ||
                other.evenement == evenement) &&
            (identical(other.delegue, delegue) || other.delegue == delegue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        date,
        nom,
        prenom,
        address,
        telephone,
        email,
        statusFlag,
        remarque,
        att1,
        att2,
        att3,
        att4,
        att5,
        att6,
        att7,
        att8,
        att9,
        att10,
        att11,
        att12,
        att13,
        att14,
        creerPar,
        creerDate,
        evenement,
        delegue
      ]);

  /// Create a copy of EventVisite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventVisiteImplCopyWith<_$EventVisiteImpl> get copyWith =>
      __$$EventVisiteImplCopyWithImpl<_$EventVisiteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventVisiteImplToJson(
      this,
    );
  }
}

abstract class _EventVisite implements EventVisite {
  const factory _EventVisite(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'date') final DateTime? date,
      @JsonKey(name: 'nom') final String? nom,
      @JsonKey(name: 'prenom') final String? prenom,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'telephone') final String? telephone,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'statusFlag') final int? statusFlag,
      @JsonKey(name: 'remarque') final String? remarque,
      @JsonKey(name: 'att1') final String? att1,
      @JsonKey(name: 'att2') final String? att2,
      @JsonKey(name: 'att3') final String? att3,
      @JsonKey(name: 'att4') final String? att4,
      @JsonKey(name: 'att5') final String? att5,
      @JsonKey(name: 'att6') final int? att6,
      @JsonKey(name: 'att7') final int? att7,
      @JsonKey(name: 'att8') final int? att8,
      @JsonKey(name: 'att9') final int? att9,
      @JsonKey(name: 'att10') final int? att10,
      @JsonKey(name: 'att11') final DateTime? att11,
      @JsonKey(name: 'att12') final DateTime? att12,
      @JsonKey(name: 'att13') final DateTime? att13,
      @JsonKey(name: 'att14') final DateTime? att14,
      @JsonKey(name: 'creerPar') final String? creerPar,
      @JsonKey(name: 'creerDate') final DateTime? creerDate,
      @JsonKey(name: 'evenement') final Event? evenement,
      @JsonKey(name: 'delegue') final Person? delegue}) = _$EventVisiteImpl;

  factory _EventVisite.fromJson(Map<String, dynamic> json) =
      _$EventVisiteImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'date')
  DateTime? get date;
  @override
  @JsonKey(name: 'nom')
  String? get nom;
  @override
  @JsonKey(name: 'prenom')
  String? get prenom;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'telephone')
  String? get telephone;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'statusFlag')
  int? get statusFlag;
  @override
  @JsonKey(name: 'remarque')
  String? get remarque;
  @override
  @JsonKey(name: 'att1')
  String? get att1;
  @override
  @JsonKey(name: 'att2')
  String? get att2;
  @override
  @JsonKey(name: 'att3')
  String? get att3;
  @override
  @JsonKey(name: 'att4')
  String? get att4;
  @override
  @JsonKey(name: 'att5')
  String? get att5;
  @override
  @JsonKey(name: 'att6')
  int? get att6;
  @override
  @JsonKey(name: 'att7')
  int? get att7;
  @override
  @JsonKey(name: 'att8')
  int? get att8;
  @override
  @JsonKey(name: 'att9')
  int? get att9;
  @override
  @JsonKey(name: 'att10')
  int? get att10;
  @override
  @JsonKey(name: 'att11')
  DateTime? get att11;
  @override
  @JsonKey(name: 'att12')
  DateTime? get att12;
  @override
  @JsonKey(name: 'att13')
  DateTime? get att13;
  @override
  @JsonKey(name: 'att14')
  DateTime? get att14;
  @override
  @JsonKey(name: 'creerPar')
  String? get creerPar;
  @override
  @JsonKey(name: 'creerDate')
  DateTime? get creerDate;
  @override
  @JsonKey(name: 'evenement')
  Event? get evenement;
  @override
  @JsonKey(name: 'delegue')
  Person? get delegue;

  /// Create a copy of EventVisite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventVisiteImplCopyWith<_$EventVisiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
