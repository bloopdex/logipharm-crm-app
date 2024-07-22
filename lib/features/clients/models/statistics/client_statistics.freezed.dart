// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientReclamation _$ClientReclamationFromJson(Map<String, dynamic> json) {
  return _ClientReclamation.fromJson(json);
}

/// @nodoc
mixin _$ClientReclamation {
  @JsonKey(name: 'statutLigne')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  int get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientReclamationCopyWith<ClientReclamation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientReclamationCopyWith<$Res> {
  factory $ClientReclamationCopyWith(
          ClientReclamation value, $Res Function(ClientReclamation) then) =
      _$ClientReclamationCopyWithImpl<$Res, ClientReclamation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'statutLigne') String status,
      @JsonKey(name: 'number') int number});
}

/// @nodoc
class _$ClientReclamationCopyWithImpl<$Res, $Val extends ClientReclamation>
    implements $ClientReclamationCopyWith<$Res> {
  _$ClientReclamationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientReclamationImplCopyWith<$Res>
    implements $ClientReclamationCopyWith<$Res> {
  factory _$$ClientReclamationImplCopyWith(_$ClientReclamationImpl value,
          $Res Function(_$ClientReclamationImpl) then) =
      __$$ClientReclamationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'statutLigne') String status,
      @JsonKey(name: 'number') int number});
}

/// @nodoc
class __$$ClientReclamationImplCopyWithImpl<$Res>
    extends _$ClientReclamationCopyWithImpl<$Res, _$ClientReclamationImpl>
    implements _$$ClientReclamationImplCopyWith<$Res> {
  __$$ClientReclamationImplCopyWithImpl(_$ClientReclamationImpl _value,
      $Res Function(_$ClientReclamationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? number = null,
  }) {
    return _then(_$ClientReclamationImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientReclamationImpl implements _ClientReclamation {
  const _$ClientReclamationImpl(
      {@JsonKey(name: 'statutLigne') required this.status,
      @JsonKey(name: 'number') required this.number});

  factory _$ClientReclamationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientReclamationImplFromJson(json);

  @override
  @JsonKey(name: 'statutLigne')
  final String status;
  @override
  @JsonKey(name: 'number')
  final int number;

  @override
  String toString() {
    return 'ClientReclamation(status: $status, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientReclamationImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientReclamationImplCopyWith<_$ClientReclamationImpl> get copyWith =>
      __$$ClientReclamationImplCopyWithImpl<_$ClientReclamationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientReclamationImplToJson(
      this,
    );
  }
}

abstract class _ClientReclamation implements ClientReclamation {
  const factory _ClientReclamation(
          {@JsonKey(name: 'statutLigne') required final String status,
          @JsonKey(name: 'number') required final int number}) =
      _$ClientReclamationImpl;

  factory _ClientReclamation.fromJson(Map<String, dynamic> json) =
      _$ClientReclamationImpl.fromJson;

  @override
  @JsonKey(name: 'statutLigne')
  String get status;
  @override
  @JsonKey(name: 'number')
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$ClientReclamationImplCopyWith<_$ClientReclamationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientStatistics _$ClientStatisticsFromJson(Map<String, dynamic> json) {
  return _ClientStatistics.fromJson(json);
}

/// @nodoc
mixin _$ClientStatistics {
  @JsonKey(name: 'companyId')
  num get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientId')
  num get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocageCommercial')
  bool get commercialBlockage => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocageFinancier')
  bool get financialBlockage => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalHt')
  num get totalHt => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTtc')
  num get totalTtc => throw _privateConstructorUsedError;
  @JsonKey(name: 'plafond')
  num get ceiling => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalReste')
  num get totalRest => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalReglement')
  num get totalPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'reclamations')
  List<ClientReclamation> get clientReclamations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientStatisticsCopyWith<ClientStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientStatisticsCopyWith<$Res> {
  factory $ClientStatisticsCopyWith(
          ClientStatistics value, $Res Function(ClientStatistics) then) =
      _$ClientStatisticsCopyWithImpl<$Res, ClientStatistics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') num companyId,
      @JsonKey(name: 'clientId') num clientId,
      @JsonKey(name: 'blocageCommercial') bool commercialBlockage,
      @JsonKey(name: 'blocageFinancier') bool financialBlockage,
      @JsonKey(name: 'totalHt') num totalHt,
      @JsonKey(name: 'totalTtc') num totalTtc,
      @JsonKey(name: 'plafond') num ceiling,
      @JsonKey(name: 'totalReste') num totalRest,
      @JsonKey(name: 'totalReglement') num totalPayment,
      @JsonKey(name: 'reclamations')
      List<ClientReclamation> clientReclamations});
}

/// @nodoc
class _$ClientStatisticsCopyWithImpl<$Res, $Val extends ClientStatistics>
    implements $ClientStatisticsCopyWith<$Res> {
  _$ClientStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? clientId = null,
    Object? commercialBlockage = null,
    Object? financialBlockage = null,
    Object? totalHt = null,
    Object? totalTtc = null,
    Object? ceiling = null,
    Object? totalRest = null,
    Object? totalPayment = null,
    Object? clientReclamations = null,
  }) {
    return _then(_value.copyWith(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as num,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as num,
      commercialBlockage: null == commercialBlockage
          ? _value.commercialBlockage
          : commercialBlockage // ignore: cast_nullable_to_non_nullable
              as bool,
      financialBlockage: null == financialBlockage
          ? _value.financialBlockage
          : financialBlockage // ignore: cast_nullable_to_non_nullable
              as bool,
      totalHt: null == totalHt
          ? _value.totalHt
          : totalHt // ignore: cast_nullable_to_non_nullable
              as num,
      totalTtc: null == totalTtc
          ? _value.totalTtc
          : totalTtc // ignore: cast_nullable_to_non_nullable
              as num,
      ceiling: null == ceiling
          ? _value.ceiling
          : ceiling // ignore: cast_nullable_to_non_nullable
              as num,
      totalRest: null == totalRest
          ? _value.totalRest
          : totalRest // ignore: cast_nullable_to_non_nullable
              as num,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as num,
      clientReclamations: null == clientReclamations
          ? _value.clientReclamations
          : clientReclamations // ignore: cast_nullable_to_non_nullable
              as List<ClientReclamation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientStatisticsImplCopyWith<$Res>
    implements $ClientStatisticsCopyWith<$Res> {
  factory _$$ClientStatisticsImplCopyWith(_$ClientStatisticsImpl value,
          $Res Function(_$ClientStatisticsImpl) then) =
      __$$ClientStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') num companyId,
      @JsonKey(name: 'clientId') num clientId,
      @JsonKey(name: 'blocageCommercial') bool commercialBlockage,
      @JsonKey(name: 'blocageFinancier') bool financialBlockage,
      @JsonKey(name: 'totalHt') num totalHt,
      @JsonKey(name: 'totalTtc') num totalTtc,
      @JsonKey(name: 'plafond') num ceiling,
      @JsonKey(name: 'totalReste') num totalRest,
      @JsonKey(name: 'totalReglement') num totalPayment,
      @JsonKey(name: 'reclamations')
      List<ClientReclamation> clientReclamations});
}

/// @nodoc
class __$$ClientStatisticsImplCopyWithImpl<$Res>
    extends _$ClientStatisticsCopyWithImpl<$Res, _$ClientStatisticsImpl>
    implements _$$ClientStatisticsImplCopyWith<$Res> {
  __$$ClientStatisticsImplCopyWithImpl(_$ClientStatisticsImpl _value,
      $Res Function(_$ClientStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? clientId = null,
    Object? commercialBlockage = null,
    Object? financialBlockage = null,
    Object? totalHt = null,
    Object? totalTtc = null,
    Object? ceiling = null,
    Object? totalRest = null,
    Object? totalPayment = null,
    Object? clientReclamations = null,
  }) {
    return _then(_$ClientStatisticsImpl(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as num,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as num,
      commercialBlockage: null == commercialBlockage
          ? _value.commercialBlockage
          : commercialBlockage // ignore: cast_nullable_to_non_nullable
              as bool,
      financialBlockage: null == financialBlockage
          ? _value.financialBlockage
          : financialBlockage // ignore: cast_nullable_to_non_nullable
              as bool,
      totalHt: null == totalHt
          ? _value.totalHt
          : totalHt // ignore: cast_nullable_to_non_nullable
              as num,
      totalTtc: null == totalTtc
          ? _value.totalTtc
          : totalTtc // ignore: cast_nullable_to_non_nullable
              as num,
      ceiling: null == ceiling
          ? _value.ceiling
          : ceiling // ignore: cast_nullable_to_non_nullable
              as num,
      totalRest: null == totalRest
          ? _value.totalRest
          : totalRest // ignore: cast_nullable_to_non_nullable
              as num,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as num,
      clientReclamations: null == clientReclamations
          ? _value._clientReclamations
          : clientReclamations // ignore: cast_nullable_to_non_nullable
              as List<ClientReclamation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientStatisticsImpl implements _ClientStatistics {
  const _$ClientStatisticsImpl(
      {@JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'clientId') required this.clientId,
      @JsonKey(name: 'blocageCommercial') required this.commercialBlockage,
      @JsonKey(name: 'blocageFinancier') required this.financialBlockage,
      @JsonKey(name: 'totalHt') required this.totalHt,
      @JsonKey(name: 'totalTtc') required this.totalTtc,
      @JsonKey(name: 'plafond') required this.ceiling,
      @JsonKey(name: 'totalReste') required this.totalRest,
      @JsonKey(name: 'totalReglement') required this.totalPayment,
      @JsonKey(name: 'reclamations')
      required final List<ClientReclamation> clientReclamations})
      : _clientReclamations = clientReclamations;

  factory _$ClientStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientStatisticsImplFromJson(json);

  @override
  @JsonKey(name: 'companyId')
  final num companyId;
  @override
  @JsonKey(name: 'clientId')
  final num clientId;
  @override
  @JsonKey(name: 'blocageCommercial')
  final bool commercialBlockage;
  @override
  @JsonKey(name: 'blocageFinancier')
  final bool financialBlockage;
  @override
  @JsonKey(name: 'totalHt')
  final num totalHt;
  @override
  @JsonKey(name: 'totalTtc')
  final num totalTtc;
  @override
  @JsonKey(name: 'plafond')
  final num ceiling;
  @override
  @JsonKey(name: 'totalReste')
  final num totalRest;
  @override
  @JsonKey(name: 'totalReglement')
  final num totalPayment;
  final List<ClientReclamation> _clientReclamations;
  @override
  @JsonKey(name: 'reclamations')
  List<ClientReclamation> get clientReclamations {
    if (_clientReclamations is EqualUnmodifiableListView)
      return _clientReclamations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clientReclamations);
  }

  @override
  String toString() {
    return 'ClientStatistics(companyId: $companyId, clientId: $clientId, commercialBlockage: $commercialBlockage, financialBlockage: $financialBlockage, totalHt: $totalHt, totalTtc: $totalTtc, ceiling: $ceiling, totalRest: $totalRest, totalPayment: $totalPayment, clientReclamations: $clientReclamations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientStatisticsImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.commercialBlockage, commercialBlockage) ||
                other.commercialBlockage == commercialBlockage) &&
            (identical(other.financialBlockage, financialBlockage) ||
                other.financialBlockage == financialBlockage) &&
            (identical(other.totalHt, totalHt) || other.totalHt == totalHt) &&
            (identical(other.totalTtc, totalTtc) ||
                other.totalTtc == totalTtc) &&
            (identical(other.ceiling, ceiling) || other.ceiling == ceiling) &&
            (identical(other.totalRest, totalRest) ||
                other.totalRest == totalRest) &&
            (identical(other.totalPayment, totalPayment) ||
                other.totalPayment == totalPayment) &&
            const DeepCollectionEquality()
                .equals(other._clientReclamations, _clientReclamations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      companyId,
      clientId,
      commercialBlockage,
      financialBlockage,
      totalHt,
      totalTtc,
      ceiling,
      totalRest,
      totalPayment,
      const DeepCollectionEquality().hash(_clientReclamations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientStatisticsImplCopyWith<_$ClientStatisticsImpl> get copyWith =>
      __$$ClientStatisticsImplCopyWithImpl<_$ClientStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientStatisticsImplToJson(
      this,
    );
  }
}

abstract class _ClientStatistics implements ClientStatistics {
  const factory _ClientStatistics(
      {@JsonKey(name: 'companyId') required final num companyId,
      @JsonKey(name: 'clientId') required final num clientId,
      @JsonKey(name: 'blocageCommercial')
      required final bool commercialBlockage,
      @JsonKey(name: 'blocageFinancier') required final bool financialBlockage,
      @JsonKey(name: 'totalHt') required final num totalHt,
      @JsonKey(name: 'totalTtc') required final num totalTtc,
      @JsonKey(name: 'plafond') required final num ceiling,
      @JsonKey(name: 'totalReste') required final num totalRest,
      @JsonKey(name: 'totalReglement') required final num totalPayment,
      @JsonKey(name: 'reclamations')
      required final List<ClientReclamation>
          clientReclamations}) = _$ClientStatisticsImpl;

  factory _ClientStatistics.fromJson(Map<String, dynamic> json) =
      _$ClientStatisticsImpl.fromJson;

  @override
  @JsonKey(name: 'companyId')
  num get companyId;
  @override
  @JsonKey(name: 'clientId')
  num get clientId;
  @override
  @JsonKey(name: 'blocageCommercial')
  bool get commercialBlockage;
  @override
  @JsonKey(name: 'blocageFinancier')
  bool get financialBlockage;
  @override
  @JsonKey(name: 'totalHt')
  num get totalHt;
  @override
  @JsonKey(name: 'totalTtc')
  num get totalTtc;
  @override
  @JsonKey(name: 'plafond')
  num get ceiling;
  @override
  @JsonKey(name: 'totalReste')
  num get totalRest;
  @override
  @JsonKey(name: 'totalReglement')
  num get totalPayment;
  @override
  @JsonKey(name: 'reclamations')
  List<ClientReclamation> get clientReclamations;
  @override
  @JsonKey(ignore: true)
  _$$ClientStatisticsImplCopyWith<_$ClientStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
