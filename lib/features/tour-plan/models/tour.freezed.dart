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
  String get tourneeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionId')
  String? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionName')
  String get regionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateDebut')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateFin')
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusFlag')
  int get statusFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateDebutEffective')
  String? get effectiveStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateFinEffective')
  String? get effectiveEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegue')
  Person get delegate => throw _privateConstructorUsedError;
  @JsonKey(name: 'superviseur')
  Person get supervisor => throw _privateConstructorUsedError;
  @JsonKey(name: 'tourneeDetails')
  List<TourDetail> get tourDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourCopyWith<Tour> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourCopyWith<$Res> {
  factory $TourCopyWith(Tour value, $Res Function(Tour) then) =
      _$TourCopyWithImpl<$Res, Tour>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tourneeId') String tourneeId,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'regionName') String regionName,
      @JsonKey(name: 'dateDebut') String startDate,
      @JsonKey(name: 'dateFin') String endDate,
      @JsonKey(name: 'statusFlag') int statusFlag,
      @JsonKey(name: 'dateDebutEffective') String? effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') String? effectiveEndDate,
      @JsonKey(name: 'delegue') Person delegate,
      @JsonKey(name: 'superviseur') Person supervisor,
      @JsonKey(name: 'tourneeDetails') List<TourDetail> tourDetails});

  $PersonCopyWith<$Res> get delegate;
  $PersonCopyWith<$Res> get supervisor;
}

/// @nodoc
class _$TourCopyWithImpl<$Res, $Val extends Tour>
    implements $TourCopyWith<$Res> {
  _$TourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tourneeId = null,
    Object? companyId = null,
    Object? regionId = freezed,
    Object? regionName = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? statusFlag = null,
    Object? effectiveStartDate = freezed,
    Object? effectiveEndDate = freezed,
    Object? delegate = null,
    Object? supervisor = null,
    Object? tourDetails = null,
  }) {
    return _then(_value.copyWith(
      tourneeId: null == tourneeId
          ? _value.tourneeId
          : tourneeId // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      statusFlag: null == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int,
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
      supervisor: null == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as Person,
      tourDetails: null == tourDetails
          ? _value.tourDetails
          : tourDetails // ignore: cast_nullable_to_non_nullable
              as List<TourDetail>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get delegate {
    return $PersonCopyWith<$Res>(_value.delegate, (value) {
      return _then(_value.copyWith(delegate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get supervisor {
    return $PersonCopyWith<$Res>(_value.supervisor, (value) {
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
      {@JsonKey(name: 'tourneeId') String tourneeId,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'regionName') String regionName,
      @JsonKey(name: 'dateDebut') String startDate,
      @JsonKey(name: 'dateFin') String endDate,
      @JsonKey(name: 'statusFlag') int statusFlag,
      @JsonKey(name: 'dateDebutEffective') String? effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') String? effectiveEndDate,
      @JsonKey(name: 'delegue') Person delegate,
      @JsonKey(name: 'superviseur') Person supervisor,
      @JsonKey(name: 'tourneeDetails') List<TourDetail> tourDetails});

  @override
  $PersonCopyWith<$Res> get delegate;
  @override
  $PersonCopyWith<$Res> get supervisor;
}

/// @nodoc
class __$$TourImplCopyWithImpl<$Res>
    extends _$TourCopyWithImpl<$Res, _$TourImpl>
    implements _$$TourImplCopyWith<$Res> {
  __$$TourImplCopyWithImpl(_$TourImpl _value, $Res Function(_$TourImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tourneeId = null,
    Object? companyId = null,
    Object? regionId = freezed,
    Object? regionName = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? statusFlag = null,
    Object? effectiveStartDate = freezed,
    Object? effectiveEndDate = freezed,
    Object? delegate = null,
    Object? supervisor = null,
    Object? tourDetails = null,
  }) {
    return _then(_$TourImpl(
      tourneeId: null == tourneeId
          ? _value.tourneeId
          : tourneeId // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      statusFlag: null == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int,
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
      supervisor: null == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as Person,
      tourDetails: null == tourDetails
          ? _value._tourDetails
          : tourDetails // ignore: cast_nullable_to_non_nullable
              as List<TourDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TourImpl implements _Tour {
  const _$TourImpl(
      {@JsonKey(name: 'tourneeId') required this.tourneeId,
      @JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'regionId') this.regionId,
      @JsonKey(name: 'regionName') required this.regionName,
      @JsonKey(name: 'dateDebut') required this.startDate,
      @JsonKey(name: 'dateFin') required this.endDate,
      @JsonKey(name: 'statusFlag') required this.statusFlag,
      @JsonKey(name: 'dateDebutEffective') this.effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') this.effectiveEndDate,
      @JsonKey(name: 'delegue') required this.delegate,
      @JsonKey(name: 'superviseur') required this.supervisor,
      @JsonKey(name: 'tourneeDetails')
      required final List<TourDetail> tourDetails})
      : _tourDetails = tourDetails;

  factory _$TourImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourImplFromJson(json);

  @override
  @JsonKey(name: 'tourneeId')
  final String tourneeId;
  @override
  @JsonKey(name: 'companyId')
  final int companyId;
  @override
  @JsonKey(name: 'regionId')
  final String? regionId;
  @override
  @JsonKey(name: 'regionName')
  final String regionName;
  @override
  @JsonKey(name: 'dateDebut')
  final String startDate;
  @override
  @JsonKey(name: 'dateFin')
  final String endDate;
  @override
  @JsonKey(name: 'statusFlag')
  final int statusFlag;
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
  final Person supervisor;
  final List<TourDetail> _tourDetails;
  @override
  @JsonKey(name: 'tourneeDetails')
  List<TourDetail> get tourDetails {
    if (_tourDetails is EqualUnmodifiableListView) return _tourDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tourDetails);
  }

  @override
  String toString() {
    return 'Tour(tourneeId: $tourneeId, companyId: $companyId, regionId: $regionId, regionName: $regionName, startDate: $startDate, endDate: $endDate, statusFlag: $statusFlag, effectiveStartDate: $effectiveStartDate, effectiveEndDate: $effectiveEndDate, delegate: $delegate, supervisor: $supervisor, tourDetails: $tourDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourImpl &&
            (identical(other.tourneeId, tourneeId) ||
                other.tourneeId == tourneeId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.regionName, regionName) ||
                other.regionName == regionName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.statusFlag, statusFlag) ||
                other.statusFlag == statusFlag) &&
            (identical(other.effectiveStartDate, effectiveStartDate) ||
                other.effectiveStartDate == effectiveStartDate) &&
            (identical(other.effectiveEndDate, effectiveEndDate) ||
                other.effectiveEndDate == effectiveEndDate) &&
            (identical(other.delegate, delegate) ||
                other.delegate == delegate) &&
            (identical(other.supervisor, supervisor) ||
                other.supervisor == supervisor) &&
            const DeepCollectionEquality()
                .equals(other._tourDetails, _tourDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tourneeId,
      companyId,
      regionId,
      regionName,
      startDate,
      endDate,
      statusFlag,
      effectiveStartDate,
      effectiveEndDate,
      delegate,
      supervisor,
      const DeepCollectionEquality().hash(_tourDetails));

  @JsonKey(ignore: true)
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
      {@JsonKey(name: 'tourneeId') required final String tourneeId,
      @JsonKey(name: 'companyId') required final int companyId,
      @JsonKey(name: 'regionId') final String? regionId,
      @JsonKey(name: 'regionName') required final String regionName,
      @JsonKey(name: 'dateDebut') required final String startDate,
      @JsonKey(name: 'dateFin') required final String endDate,
      @JsonKey(name: 'statusFlag') required final int statusFlag,
      @JsonKey(name: 'dateDebutEffective') final String? effectiveStartDate,
      @JsonKey(name: 'dateFinEffective') final String? effectiveEndDate,
      @JsonKey(name: 'delegue') required final Person delegate,
      @JsonKey(name: 'superviseur') required final Person supervisor,
      @JsonKey(name: 'tourneeDetails')
      required final List<TourDetail> tourDetails}) = _$TourImpl;

  factory _Tour.fromJson(Map<String, dynamic> json) = _$TourImpl.fromJson;

  @override
  @JsonKey(name: 'tourneeId')
  String get tourneeId;
  @override
  @JsonKey(name: 'companyId')
  int get companyId;
  @override
  @JsonKey(name: 'regionId')
  String? get regionId;
  @override
  @JsonKey(name: 'regionName')
  String get regionName;
  @override
  @JsonKey(name: 'dateDebut')
  String get startDate;
  @override
  @JsonKey(name: 'dateFin')
  String get endDate;
  @override
  @JsonKey(name: 'statusFlag')
  int get statusFlag;
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
  Person get supervisor;
  @override
  @JsonKey(name: 'tourneeDetails')
  List<TourDetail> get tourDetails;
  @override
  @JsonKey(ignore: true)
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
  @JsonKey(name: 'motif')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'repport')
  String? get report => throw _privateConstructorUsedError;
  @JsonKey(name: 'pharmacie')
  Person? get pharmacy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'dateDebut') String? startDate,
      @JsonKey(name: 'dateFin') String? endDate,
      @JsonKey(name: 'statusFlag') int? statusFlag,
      @JsonKey(name: 'motif') String? reason,
      @JsonKey(name: 'repport') String? report,
      @JsonKey(name: 'pharmacie') Person? pharmacy});

  $PersonCopyWith<$Res>? get pharmacy;
}

/// @nodoc
class _$TourDetailCopyWithImpl<$Res, $Val extends TourDetail>
    implements $TourDetailCopyWith<$Res> {
  _$TourDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterTourId = null,
    Object? companyId = null,
    Object? regionId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statusFlag = freezed,
    Object? reason = freezed,
    Object? report = freezed,
    Object? pharmacy = freezed,
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
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String?,
      pharmacy: freezed == pharmacy
          ? _value.pharmacy
          : pharmacy // ignore: cast_nullable_to_non_nullable
              as Person?,
    ) as $Val);
  }

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
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'dateDebut') String? startDate,
      @JsonKey(name: 'dateFin') String? endDate,
      @JsonKey(name: 'statusFlag') int? statusFlag,
      @JsonKey(name: 'motif') String? reason,
      @JsonKey(name: 'repport') String? report,
      @JsonKey(name: 'pharmacie') Person? pharmacy});

  @override
  $PersonCopyWith<$Res>? get pharmacy;
}

/// @nodoc
class __$$TourDetailImplCopyWithImpl<$Res>
    extends _$TourDetailCopyWithImpl<$Res, _$TourDetailImpl>
    implements _$$TourDetailImplCopyWith<$Res> {
  __$$TourDetailImplCopyWithImpl(
      _$TourDetailImpl _value, $Res Function(_$TourDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterTourId = null,
    Object? companyId = null,
    Object? regionId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statusFlag = freezed,
    Object? reason = freezed,
    Object? report = freezed,
    Object? pharmacy = freezed,
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
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String?,
      pharmacy: freezed == pharmacy
          ? _value.pharmacy
          : pharmacy // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'regionId') this.regionId,
      @JsonKey(name: 'dateDebut') this.startDate,
      @JsonKey(name: 'dateFin') this.endDate,
      @JsonKey(name: 'statusFlag') this.statusFlag,
      @JsonKey(name: 'motif') this.reason,
      @JsonKey(name: 'repport') this.report,
      @JsonKey(name: 'pharmacie') this.pharmacy});

  factory _$TourDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourDetailImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'tourneMaitreId')
  final String masterTourId;
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
  @JsonKey(name: 'motif')
  final String? reason;
  @override
  @JsonKey(name: 'repport')
  final String? report;
  @override
  @JsonKey(name: 'pharmacie')
  final Person? pharmacy;

  @override
  String toString() {
    return 'TourDetail(id: $id, masterTourId: $masterTourId, companyId: $companyId, regionId: $regionId, startDate: $startDate, endDate: $endDate, statusFlag: $statusFlag, reason: $reason, report: $report, pharmacy: $pharmacy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.masterTourId, masterTourId) ||
                other.masterTourId == masterTourId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.statusFlag, statusFlag) ||
                other.statusFlag == statusFlag) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.pharmacy, pharmacy) ||
                other.pharmacy == pharmacy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, masterTourId, companyId,
      regionId, startDate, endDate, statusFlag, reason, report, pharmacy);

  @JsonKey(ignore: true)
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
      @JsonKey(name: 'companyId') required final int companyId,
      @JsonKey(name: 'regionId') final String? regionId,
      @JsonKey(name: 'dateDebut') final String? startDate,
      @JsonKey(name: 'dateFin') final String? endDate,
      @JsonKey(name: 'statusFlag') final int? statusFlag,
      @JsonKey(name: 'motif') final String? reason,
      @JsonKey(name: 'repport') final String? report,
      @JsonKey(name: 'pharmacie') final Person? pharmacy}) = _$TourDetailImpl;

  factory _TourDetail.fromJson(Map<String, dynamic> json) =
      _$TourDetailImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'tourneMaitreId')
  String get masterTourId;
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
  @JsonKey(name: 'motif')
  String? get reason;
  @override
  @JsonKey(name: 'repport')
  String? get report;
  @override
  @JsonKey(name: 'pharmacie')
  Person? get pharmacy;
  @override
  @JsonKey(ignore: true)
  _$$TourDetailImplCopyWith<_$TourDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
