// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tour _$TourFromJson(Map<String, dynamic> json) {
  return _Tour.fromJson(json);
}

/// @nodoc
mixin _$Tour {
  @JsonKey(name: 'tourneeId')
  String get tourId => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionId')
  String get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionName')
  String? get regionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateDebut')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateFin')
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusFlag')
  int get statusFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusName')
  String? get statusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateDebutEffective')
  String? get effectiveStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateFinEffective')
  String? get effectiveEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegue')
  Person get delegate => throw _privateConstructorUsedError;
  @JsonKey(name: 'superviseur')
  Person? get supervisor => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalClients')
  int? get totalClients => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitedClients')
  int? get visitedClients => throw _privateConstructorUsedError;
  @JsonKey(name: 'tourneeDetails')
  List<TourDetail>? get pharmacies => throw _privateConstructorUsedError;

  /// Serializes this Tour to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourCopyWith<Tour> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourCopyWith<$Res> {
  factory $TourCopyWith(Tour value, $Res Function(Tour) then) =
      _$TourCopyWithImpl<$Res, Tour>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tourneeId') String tourId,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String regionId,
      @JsonKey(name: 'regionName') String? regionName,
      @JsonKey(name: 'nom') String? name,
      @JsonKey(name: 'dateDebut') String? startDate,
      @JsonKey(name: 'dateFin') String? endDate,
      @JsonKey(name: 'statusFlag') int statusFlag,
      @JsonKey(name: 'statusName') String? statusName,
      @JsonKey(name: 'dateDebutEffective') String? effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') String? effectiveEndDate,
      @JsonKey(name: 'delegue') Person delegate,
      @JsonKey(name: 'superviseur') Person? supervisor,
      @JsonKey(name: 'totalClients') int? totalClients,
      @JsonKey(name: 'visitedClients') int? visitedClients,
      @JsonKey(name: 'tourneeDetails') List<TourDetail>? pharmacies});

  $PersonCopyWith<$Res> get delegate;
  $PersonCopyWith<$Res>? get supervisor;
}

/// @nodoc
class _$TourCopyWithImpl<$Res, $Val extends Tour>
    implements $TourCopyWith<$Res> {
  _$TourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tourId = null,
    Object? companyId = null,
    Object? regionId = null,
    Object? regionName = freezed,
    Object? name = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statusFlag = null,
    Object? statusName = freezed,
    Object? effectiveStartDate = freezed,
    Object? effectiveEndDate = freezed,
    Object? delegate = null,
    Object? supervisor = freezed,
    Object? totalClients = freezed,
    Object? visitedClients = freezed,
    Object? pharmacies = freezed,
  }) {
    return _then(_value.copyWith(
      tourId: null == tourId
          ? _value.tourId
          : tourId // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: freezed == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: null == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveStartDate: freezed == effectiveStartDate
          ? _value.effectiveStartDate
          : effectiveStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveEndDate: freezed == effectiveEndDate
          ? _value.effectiveEndDate
          : effectiveEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      delegate: null == delegate
          ? _value.delegate
          : delegate // ignore: cast_nullable_to_non_nullable
              as Person,
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as Person?,
      totalClients: freezed == totalClients
          ? _value.totalClients
          : totalClients // ignore: cast_nullable_to_non_nullable
              as int?,
      visitedClients: freezed == visitedClients
          ? _value.visitedClients
          : visitedClients // ignore: cast_nullable_to_non_nullable
              as int?,
      pharmacies: freezed == pharmacies
          ? _value.pharmacies
          : pharmacies // ignore: cast_nullable_to_non_nullable
              as List<TourDetail>?,
    ) as $Val);
  }

  /// Create a copy of Tour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get delegate {
    return $PersonCopyWith<$Res>(_value.delegate, (value) {
      return _then(_value.copyWith(delegate: value) as $Val);
    });
  }

  /// Create a copy of Tour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res>? get supervisor {
    if (_value.supervisor == null) {
      return null;
    }

    return $PersonCopyWith<$Res>(_value.supervisor!, (value) {
      return _then(_value.copyWith(supervisor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TourImplCopyWith<$Res> implements $TourCopyWith<$Res> {
  factory _$$TourImplCopyWith(
          _$TourImpl value, $Res Function(_$TourImpl) then) =
      __$$TourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tourneeId') String tourId,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String regionId,
      @JsonKey(name: 'regionName') String? regionName,
      @JsonKey(name: 'nom') String? name,
      @JsonKey(name: 'dateDebut') String? startDate,
      @JsonKey(name: 'dateFin') String? endDate,
      @JsonKey(name: 'statusFlag') int statusFlag,
      @JsonKey(name: 'statusName') String? statusName,
      @JsonKey(name: 'dateDebutEffective') String? effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') String? effectiveEndDate,
      @JsonKey(name: 'delegue') Person delegate,
      @JsonKey(name: 'superviseur') Person? supervisor,
      @JsonKey(name: 'totalClients') int? totalClients,
      @JsonKey(name: 'visitedClients') int? visitedClients,
      @JsonKey(name: 'tourneeDetails') List<TourDetail>? pharmacies});

  @override
  $PersonCopyWith<$Res> get delegate;
  @override
  $PersonCopyWith<$Res>? get supervisor;
}

/// @nodoc
class __$$TourImplCopyWithImpl<$Res>
    extends _$TourCopyWithImpl<$Res, _$TourImpl>
    implements _$$TourImplCopyWith<$Res> {
  __$$TourImplCopyWithImpl(_$TourImpl _value, $Res Function(_$TourImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tourId = null,
    Object? companyId = null,
    Object? regionId = null,
    Object? regionName = freezed,
    Object? name = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statusFlag = null,
    Object? statusName = freezed,
    Object? effectiveStartDate = freezed,
    Object? effectiveEndDate = freezed,
    Object? delegate = null,
    Object? supervisor = freezed,
    Object? totalClients = freezed,
    Object? visitedClients = freezed,
    Object? pharmacies = freezed,
  }) {
    return _then(_$TourImpl(
      tourId: null == tourId
          ? _value.tourId
          : tourId // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: freezed == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: null == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveStartDate: freezed == effectiveStartDate
          ? _value.effectiveStartDate
          : effectiveStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveEndDate: freezed == effectiveEndDate
          ? _value.effectiveEndDate
          : effectiveEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      delegate: null == delegate
          ? _value.delegate
          : delegate // ignore: cast_nullable_to_non_nullable
              as Person,
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as Person?,
      totalClients: freezed == totalClients
          ? _value.totalClients
          : totalClients // ignore: cast_nullable_to_non_nullable
              as int?,
      visitedClients: freezed == visitedClients
          ? _value.visitedClients
          : visitedClients // ignore: cast_nullable_to_non_nullable
              as int?,
      pharmacies: freezed == pharmacies
          ? _value._pharmacies
          : pharmacies // ignore: cast_nullable_to_non_nullable
              as List<TourDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TourImpl implements _Tour {
  const _$TourImpl(
      {@JsonKey(name: 'tourneeId') required this.tourId,
      @JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'regionId') required this.regionId,
      @JsonKey(name: 'regionName') this.regionName,
      @JsonKey(name: 'nom') this.name,
      @JsonKey(name: 'dateDebut') required this.startDate,
      @JsonKey(name: 'dateFin') required this.endDate,
      @JsonKey(name: 'statusFlag') required this.statusFlag,
      @JsonKey(name: 'statusName') this.statusName,
      @JsonKey(name: 'dateDebutEffective') this.effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') this.effectiveEndDate,
      @JsonKey(name: 'delegue') required this.delegate,
      @JsonKey(name: 'superviseur') this.supervisor,
      @JsonKey(name: 'totalClients') this.totalClients,
      @JsonKey(name: 'visitedClients') this.visitedClients,
      @JsonKey(name: 'tourneeDetails') final List<TourDetail>? pharmacies})
      : _pharmacies = pharmacies;

  factory _$TourImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourImplFromJson(json);

  @override
  @JsonKey(name: 'tourneeId')
  final String tourId;
  @override
  @JsonKey(name: 'companyId')
  final int companyId;
  @override
  @JsonKey(name: 'regionId')
  final String regionId;
  @override
  @JsonKey(name: 'regionName')
  final String? regionName;
  @override
  @JsonKey(name: 'nom')
  final String? name;
  @override
  @JsonKey(name: 'dateDebut')
  final String? startDate;
  @override
  @JsonKey(name: 'dateFin')
  final String? endDate;
  @override
  @JsonKey(name: 'statusFlag')
  final int statusFlag;
  @override
  @JsonKey(name: 'statusName')
  final String? statusName;
  @override
  @JsonKey(name: 'dateDebutEffective')
  final String? effectiveStartDate;
  @override
  @JsonKey(name: 'dateFinEffective')
  final String? effectiveEndDate;
  @override
  @JsonKey(name: 'delegue')
  final Person delegate;
  @override
  @JsonKey(name: 'superviseur')
  final Person? supervisor;
  @override
  @JsonKey(name: 'totalClients')
  final int? totalClients;
  @override
  @JsonKey(name: 'visitedClients')
  final int? visitedClients;
  final List<TourDetail>? _pharmacies;
  @override
  @JsonKey(name: 'tourneeDetails')
  List<TourDetail>? get pharmacies {
    final value = _pharmacies;
    if (value == null) return null;
    if (_pharmacies is EqualUnmodifiableListView) return _pharmacies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Tour(tourId: $tourId, companyId: $companyId, regionId: $regionId, regionName: $regionName, name: $name, startDate: $startDate, endDate: $endDate, statusFlag: $statusFlag, statusName: $statusName, effectiveStartDate: $effectiveStartDate, effectiveEndDate: $effectiveEndDate, delegate: $delegate, supervisor: $supervisor, totalClients: $totalClients, visitedClients: $visitedClients, pharmacies: $pharmacies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourImpl &&
            (identical(other.tourId, tourId) || other.tourId == tourId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.regionName, regionName) ||
                other.regionName == regionName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.statusFlag, statusFlag) ||
                other.statusFlag == statusFlag) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.effectiveStartDate, effectiveStartDate) ||
                other.effectiveStartDate == effectiveStartDate) &&
            (identical(other.effectiveEndDate, effectiveEndDate) ||
                other.effectiveEndDate == effectiveEndDate) &&
            (identical(other.delegate, delegate) ||
                other.delegate == delegate) &&
            (identical(other.supervisor, supervisor) ||
                other.supervisor == supervisor) &&
            (identical(other.totalClients, totalClients) ||
                other.totalClients == totalClients) &&
            (identical(other.visitedClients, visitedClients) ||
                other.visitedClients == visitedClients) &&
            const DeepCollectionEquality()
                .equals(other._pharmacies, _pharmacies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tourId,
      companyId,
      regionId,
      regionName,
      name,
      startDate,
      endDate,
      statusFlag,
      statusName,
      effectiveStartDate,
      effectiveEndDate,
      delegate,
      supervisor,
      totalClients,
      visitedClients,
      const DeepCollectionEquality().hash(_pharmacies));

  /// Create a copy of Tour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourImplCopyWith<_$TourImpl> get copyWith =>
      __$$TourImplCopyWithImpl<_$TourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TourImplToJson(
      this,
    );
  }
}

abstract class _Tour implements Tour {
  const factory _Tour(
      {@JsonKey(name: 'tourneeId') required final String tourId,
      @JsonKey(name: 'companyId') required final int companyId,
      @JsonKey(name: 'regionId') required final String regionId,
      @JsonKey(name: 'regionName') final String? regionName,
      @JsonKey(name: 'nom') final String? name,
      @JsonKey(name: 'dateDebut') required final String? startDate,
      @JsonKey(name: 'dateFin') required final String? endDate,
      @JsonKey(name: 'statusFlag') required final int statusFlag,
      @JsonKey(name: 'statusName') final String? statusName,
      @JsonKey(name: 'dateDebutEffective') final String? effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') final String? effectiveEndDate,
      @JsonKey(name: 'delegue') required final Person delegate,
      @JsonKey(name: 'superviseur') final Person? supervisor,
      @JsonKey(name: 'totalClients') final int? totalClients,
      @JsonKey(name: 'visitedClients') final int? visitedClients,
      @JsonKey(name: 'tourneeDetails')
      final List<TourDetail>? pharmacies}) = _$TourImpl;

  factory _Tour.fromJson(Map<String, dynamic> json) = _$TourImpl.fromJson;

  @override
  @JsonKey(name: 'tourneeId')
  String get tourId;
  @override
  @JsonKey(name: 'companyId')
  int get companyId;
  @override
  @JsonKey(name: 'regionId')
  String get regionId;
  @override
  @JsonKey(name: 'regionName')
  String? get regionName;
  @override
  @JsonKey(name: 'nom')
  String? get name;
  @override
  @JsonKey(name: 'dateDebut')
  String? get startDate;
  @override
  @JsonKey(name: 'dateFin')
  String? get endDate;
  @override
  @JsonKey(name: 'statusFlag')
  int get statusFlag;
  @override
  @JsonKey(name: 'statusName')
  String? get statusName;
  @override
  @JsonKey(name: 'dateDebutEffective')
  String? get effectiveStartDate;
  @override
  @JsonKey(name: 'dateFinEffective')
  String? get effectiveEndDate;
  @override
  @JsonKey(name: 'delegue')
  Person get delegate;
  @override
  @JsonKey(name: 'superviseur')
  Person? get supervisor;
  @override
  @JsonKey(name: 'totalClients')
  int? get totalClients;
  @override
  @JsonKey(name: 'visitedClients')
  int? get visitedClients;
  @override
  @JsonKey(name: 'tourneeDetails')
  List<TourDetail>? get pharmacies;

  /// Create a copy of Tour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourImplCopyWith<_$TourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TourDetail _$TourDetailFromJson(Map<String, dynamic> json) {
  return _TourDetail.fromJson(json);
}

/// @nodoc
mixin _$TourDetail {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tourneMaitreId')
  String get masterTourId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tourneTitle')
  String? get masterTourTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionId')
  String? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateDebut')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateFin')
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusFlag')
  int? get statusFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusName')
  String? get statusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'motif')
  Motif? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'repport')
  String? get report => throw _privateConstructorUsedError;
  @JsonKey(name: 'repportText')
  String? get reportText => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pharmacie')
  Person? get pharmacy => throw _privateConstructorUsedError; // Optional fields
  @JsonKey(name: 'delegue')
  Person? get delegate => throw _privateConstructorUsedError;

  /// Serializes this TourDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourDetailCopyWith<TourDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourDetailCopyWith<$Res> {
  factory $TourDetailCopyWith(
          TourDetail value, $Res Function(TourDetail) then) =
      _$TourDetailCopyWithImpl<$Res, TourDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tourneMaitreId') String masterTourId,
      @JsonKey(name: 'tourneTitle') String? masterTourTitle,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'dateDebut') String? startDate,
      @JsonKey(name: 'dateFin') String? endDate,
      @JsonKey(name: 'statusFlag') int? statusFlag,
      @JsonKey(name: 'statusName') String? statusName,
      @JsonKey(name: 'motif') Motif? reason,
      @JsonKey(name: 'repport') String? report,
      @JsonKey(name: 'repportText') String? reportText,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'pharmacie') Person? pharmacy,
      @JsonKey(name: 'delegue') Person? delegate});

  $MotifCopyWith<$Res>? get reason;
  $PersonCopyWith<$Res>? get pharmacy;
  $PersonCopyWith<$Res>? get delegate;
}

/// @nodoc
class _$TourDetailCopyWithImpl<$Res, $Val extends TourDetail>
    implements $TourDetailCopyWith<$Res> {
  _$TourDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterTourId = null,
    Object? masterTourTitle = freezed,
    Object? companyId = null,
    Object? regionId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statusFlag = freezed,
    Object? statusName = freezed,
    Object? reason = freezed,
    Object? report = freezed,
    Object? reportText = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? pharmacy = freezed,
    Object? delegate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      masterTourId: null == masterTourId
          ? _value.masterTourId
          : masterTourId // ignore: cast_nullable_to_non_nullable
              as String,
      masterTourTitle: freezed == masterTourTitle
          ? _value.masterTourTitle
          : masterTourTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: freezed == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Motif?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String?,
      reportText: freezed == reportText
          ? _value.reportText
          : reportText // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pharmacy: freezed == pharmacy
          ? _value.pharmacy
          : pharmacy // ignore: cast_nullable_to_non_nullable
              as Person?,
      delegate: freezed == delegate
          ? _value.delegate
          : delegate // ignore: cast_nullable_to_non_nullable
              as Person?,
    ) as $Val);
  }

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MotifCopyWith<$Res>? get reason {
    if (_value.reason == null) {
      return null;
    }

    return $MotifCopyWith<$Res>(_value.reason!, (value) {
      return _then(_value.copyWith(reason: value) as $Val);
    });
  }

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res>? get pharmacy {
    if (_value.pharmacy == null) {
      return null;
    }

    return $PersonCopyWith<$Res>(_value.pharmacy!, (value) {
      return _then(_value.copyWith(pharmacy: value) as $Val);
    });
  }

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res>? get delegate {
    if (_value.delegate == null) {
      return null;
    }

    return $PersonCopyWith<$Res>(_value.delegate!, (value) {
      return _then(_value.copyWith(delegate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TourDetailImplCopyWith<$Res>
    implements $TourDetailCopyWith<$Res> {
  factory _$$TourDetailImplCopyWith(
          _$TourDetailImpl value, $Res Function(_$TourDetailImpl) then) =
      __$$TourDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tourneMaitreId') String masterTourId,
      @JsonKey(name: 'tourneTitle') String? masterTourTitle,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'dateDebut') String? startDate,
      @JsonKey(name: 'dateFin') String? endDate,
      @JsonKey(name: 'statusFlag') int? statusFlag,
      @JsonKey(name: 'statusName') String? statusName,
      @JsonKey(name: 'motif') Motif? reason,
      @JsonKey(name: 'repport') String? report,
      @JsonKey(name: 'repportText') String? reportText,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'pharmacie') Person? pharmacy,
      @JsonKey(name: 'delegue') Person? delegate});

  @override
  $MotifCopyWith<$Res>? get reason;
  @override
  $PersonCopyWith<$Res>? get pharmacy;
  @override
  $PersonCopyWith<$Res>? get delegate;
}

/// @nodoc
class __$$TourDetailImplCopyWithImpl<$Res>
    extends _$TourDetailCopyWithImpl<$Res, _$TourDetailImpl>
    implements _$$TourDetailImplCopyWith<$Res> {
  __$$TourDetailImplCopyWithImpl(
      _$TourDetailImpl _value, $Res Function(_$TourDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterTourId = null,
    Object? masterTourTitle = freezed,
    Object? companyId = null,
    Object? regionId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statusFlag = freezed,
    Object? statusName = freezed,
    Object? reason = freezed,
    Object? report = freezed,
    Object? reportText = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? pharmacy = freezed,
    Object? delegate = freezed,
  }) {
    return _then(_$TourDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      masterTourId: null == masterTourId
          ? _value.masterTourId
          : masterTourId // ignore: cast_nullable_to_non_nullable
              as String,
      masterTourTitle: freezed == masterTourTitle
          ? _value.masterTourTitle
          : masterTourTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: freezed == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Motif?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String?,
      reportText: freezed == reportText
          ? _value.reportText
          : reportText // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pharmacy: freezed == pharmacy
          ? _value.pharmacy
          : pharmacy // ignore: cast_nullable_to_non_nullable
              as Person?,
      delegate: freezed == delegate
          ? _value.delegate
          : delegate // ignore: cast_nullable_to_non_nullable
              as Person?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TourDetailImpl implements _TourDetail {
  const _$TourDetailImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'tourneMaitreId') required this.masterTourId,
      @JsonKey(name: 'tourneTitle') this.masterTourTitle,
      @JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'regionId') this.regionId,
      @JsonKey(name: 'dateDebut') this.startDate,
      @JsonKey(name: 'dateFin') this.endDate,
      @JsonKey(name: 'statusFlag') this.statusFlag,
      @JsonKey(name: 'statusName') this.statusName,
      @JsonKey(name: 'motif') this.reason,
      @JsonKey(name: 'repport') this.report,
      @JsonKey(name: 'repportText') this.reportText,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'pharmacie') this.pharmacy,
      @JsonKey(name: 'delegue') this.delegate});

  factory _$TourDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourDetailImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'tourneMaitreId')
  final String masterTourId;
  @override
  @JsonKey(name: 'tourneTitle')
  final String? masterTourTitle;
  @override
  @JsonKey(name: 'companyId')
  final int companyId;
  @override
  @JsonKey(name: 'regionId')
  final String? regionId;
  @override
  @JsonKey(name: 'dateDebut')
  final String? startDate;
  @override
  @JsonKey(name: 'dateFin')
  final String? endDate;
  @override
  @JsonKey(name: 'statusFlag')
  final int? statusFlag;
  @override
  @JsonKey(name: 'statusName')
  final String? statusName;
  @override
  @JsonKey(name: 'motif')
  final Motif? reason;
  @override
  @JsonKey(name: 'repport')
  final String? report;
  @override
  @JsonKey(name: 'repportText')
  final String? reportText;
  @override
  @JsonKey(name: 'latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'longitude')
  final double? longitude;
  @override
  @JsonKey(name: 'pharmacie')
  final Person? pharmacy;
// Optional fields
  @override
  @JsonKey(name: 'delegue')
  final Person? delegate;

  @override
  String toString() {
    return 'TourDetail(id: $id, masterTourId: $masterTourId, masterTourTitle: $masterTourTitle, companyId: $companyId, regionId: $regionId, startDate: $startDate, endDate: $endDate, statusFlag: $statusFlag, statusName: $statusName, reason: $reason, report: $report, reportText: $reportText, latitude: $latitude, longitude: $longitude, pharmacy: $pharmacy, delegate: $delegate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.masterTourId, masterTourId) ||
                other.masterTourId == masterTourId) &&
            (identical(other.masterTourTitle, masterTourTitle) ||
                other.masterTourTitle == masterTourTitle) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.statusFlag, statusFlag) ||
                other.statusFlag == statusFlag) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.reportText, reportText) ||
                other.reportText == reportText) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.pharmacy, pharmacy) ||
                other.pharmacy == pharmacy) &&
            (identical(other.delegate, delegate) ||
                other.delegate == delegate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      masterTourId,
      masterTourTitle,
      companyId,
      regionId,
      startDate,
      endDate,
      statusFlag,
      statusName,
      reason,
      report,
      reportText,
      latitude,
      longitude,
      pharmacy,
      delegate);

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourDetailImplCopyWith<_$TourDetailImpl> get copyWith =>
      __$$TourDetailImplCopyWithImpl<_$TourDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TourDetailImplToJson(
      this,
    );
  }
}

abstract class _TourDetail implements TourDetail {
  const factory _TourDetail(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'tourneMaitreId') required final String masterTourId,
      @JsonKey(name: 'tourneTitle') final String? masterTourTitle,
      @JsonKey(name: 'companyId') required final int companyId,
      @JsonKey(name: 'regionId') final String? regionId,
      @JsonKey(name: 'dateDebut') final String? startDate,
      @JsonKey(name: 'dateFin') final String? endDate,
      @JsonKey(name: 'statusFlag') final int? statusFlag,
      @JsonKey(name: 'statusName') final String? statusName,
      @JsonKey(name: 'motif') final Motif? reason,
      @JsonKey(name: 'repport') final String? report,
      @JsonKey(name: 'repportText') final String? reportText,
      @JsonKey(name: 'latitude') final double? latitude,
      @JsonKey(name: 'longitude') final double? longitude,
      @JsonKey(name: 'pharmacie') final Person? pharmacy,
      @JsonKey(name: 'delegue') final Person? delegate}) = _$TourDetailImpl;

  factory _TourDetail.fromJson(Map<String, dynamic> json) =
      _$TourDetailImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'tourneMaitreId')
  String get masterTourId;
  @override
  @JsonKey(name: 'tourneTitle')
  String? get masterTourTitle;
  @override
  @JsonKey(name: 'companyId')
  int get companyId;
  @override
  @JsonKey(name: 'regionId')
  String? get regionId;
  @override
  @JsonKey(name: 'dateDebut')
  String? get startDate;
  @override
  @JsonKey(name: 'dateFin')
  String? get endDate;
  @override
  @JsonKey(name: 'statusFlag')
  int? get statusFlag;
  @override
  @JsonKey(name: 'statusName')
  String? get statusName;
  @override
  @JsonKey(name: 'motif')
  Motif? get reason;
  @override
  @JsonKey(name: 'repport')
  String? get report;
  @override
  @JsonKey(name: 'repportText')
  String? get reportText;
  @override
  @JsonKey(name: 'latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'longitude')
  double? get longitude;
  @override
  @JsonKey(name: 'pharmacie')
  Person? get pharmacy; // Optional fields
  @override
  @JsonKey(name: 'delegue')
  Person? get delegate;

  /// Create a copy of TourDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourDetailImplCopyWith<_$TourDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Motif _$MotifFromJson(Map<String, dynamic> json) {
  return _Motif.fromJson(json);
}

/// @nodoc
mixin _$Motif {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;

  /// Serializes this Motif to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Motif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotifCopyWith<Motif> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotifCopyWith<$Res> {
  factory $MotifCopyWith(Motif value, $Res Function(Motif) then) =
      _$MotifCopyWithImpl<$Res, Motif>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class _$MotifCopyWithImpl<$Res, $Val extends Motif>
    implements $MotifCopyWith<$Res> {
  _$MotifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Motif
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
abstract class _$$MotifImplCopyWith<$Res> implements $MotifCopyWith<$Res> {
  factory _$$MotifImplCopyWith(
          _$MotifImpl value, $Res Function(_$MotifImpl) then) =
      __$$MotifImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class __$$MotifImplCopyWithImpl<$Res>
    extends _$MotifCopyWithImpl<$Res, _$MotifImpl>
    implements _$$MotifImplCopyWith<$Res> {
  __$$MotifImplCopyWithImpl(
      _$MotifImpl _value, $Res Function(_$MotifImpl) _then)
      : super(_value, _then);

  /// Create a copy of Motif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$MotifImpl(
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
class _$MotifImpl implements _Motif {
  const _$MotifImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'label') required this.label});

  factory _$MotifImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotifImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'label')
  final String label;

  @override
  String toString() {
    return 'Motif(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotifImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  /// Create a copy of Motif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotifImplCopyWith<_$MotifImpl> get copyWith =>
      __$$MotifImplCopyWithImpl<_$MotifImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotifImplToJson(
      this,
    );
  }
}

abstract class _Motif implements Motif {
  const factory _Motif(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'label') required final String label}) = _$MotifImpl;

  factory _Motif.fromJson(Map<String, dynamic> json) = _$MotifImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'label')
  String get label;

  /// Create a copy of Motif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotifImplCopyWith<_$MotifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
