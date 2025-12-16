// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonthlyStatistics _$MonthlyStatisticsFromJson(Map<String, dynamic> json) {
  return _MonthlyStatistics.fromJson(json);
}

/// @nodoc
mixin _$MonthlyStatistics {
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  OrderStats get orders => throw _privateConstructorUsedError;
  List<ArticleStats> get articles => throw _privateConstructorUsedError;
  ProspectStats get prospects => throw _privateConstructorUsedError;
  ObjectiveStats get objectives => throw _privateConstructorUsedError;

  /// Serializes this MonthlyStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyStatisticsCopyWith<MonthlyStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyStatisticsCopyWith<$Res> {
  factory $MonthlyStatisticsCopyWith(
          MonthlyStatistics value, $Res Function(MonthlyStatistics) then) =
      _$MonthlyStatisticsCopyWithImpl<$Res, MonthlyStatistics>;
  @useResult
  $Res call(
      {DateTime periodStart,
      DateTime periodEnd,
      OrderStats orders,
      List<ArticleStats> articles,
      ProspectStats prospects,
      ObjectiveStats objectives});

  $OrderStatsCopyWith<$Res> get orders;
  $ProspectStatsCopyWith<$Res> get prospects;
  $ObjectiveStatsCopyWith<$Res> get objectives;
}

/// @nodoc
class _$MonthlyStatisticsCopyWithImpl<$Res, $Val extends MonthlyStatistics>
    implements $MonthlyStatisticsCopyWith<$Res> {
  _$MonthlyStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? orders = null,
    Object? articles = null,
    Object? prospects = null,
    Object? objectives = null,
  }) {
    return _then(_value.copyWith(
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as OrderStats,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleStats>,
      prospects: null == prospects
          ? _value.prospects
          : prospects // ignore: cast_nullable_to_non_nullable
              as ProspectStats,
      objectives: null == objectives
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as ObjectiveStats,
    ) as $Val);
  }

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderStatsCopyWith<$Res> get orders {
    return $OrderStatsCopyWith<$Res>(_value.orders, (value) {
      return _then(_value.copyWith(orders: value) as $Val);
    });
  }

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProspectStatsCopyWith<$Res> get prospects {
    return $ProspectStatsCopyWith<$Res>(_value.prospects, (value) {
      return _then(_value.copyWith(prospects: value) as $Val);
    });
  }

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ObjectiveStatsCopyWith<$Res> get objectives {
    return $ObjectiveStatsCopyWith<$Res>(_value.objectives, (value) {
      return _then(_value.copyWith(objectives: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlyStatisticsImplCopyWith<$Res>
    implements $MonthlyStatisticsCopyWith<$Res> {
  factory _$$MonthlyStatisticsImplCopyWith(_$MonthlyStatisticsImpl value,
          $Res Function(_$MonthlyStatisticsImpl) then) =
      __$$MonthlyStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime periodStart,
      DateTime periodEnd,
      OrderStats orders,
      List<ArticleStats> articles,
      ProspectStats prospects,
      ObjectiveStats objectives});

  @override
  $OrderStatsCopyWith<$Res> get orders;
  @override
  $ProspectStatsCopyWith<$Res> get prospects;
  @override
  $ObjectiveStatsCopyWith<$Res> get objectives;
}

/// @nodoc
class __$$MonthlyStatisticsImplCopyWithImpl<$Res>
    extends _$MonthlyStatisticsCopyWithImpl<$Res, _$MonthlyStatisticsImpl>
    implements _$$MonthlyStatisticsImplCopyWith<$Res> {
  __$$MonthlyStatisticsImplCopyWithImpl(_$MonthlyStatisticsImpl _value,
      $Res Function(_$MonthlyStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? orders = null,
    Object? articles = null,
    Object? prospects = null,
    Object? objectives = null,
  }) {
    return _then(_$MonthlyStatisticsImpl(
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as OrderStats,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleStats>,
      prospects: null == prospects
          ? _value.prospects
          : prospects // ignore: cast_nullable_to_non_nullable
              as ProspectStats,
      objectives: null == objectives
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as ObjectiveStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyStatisticsImpl implements _MonthlyStatistics {
  const _$MonthlyStatisticsImpl(
      {required this.periodStart,
      required this.periodEnd,
      required this.orders,
      required final List<ArticleStats> articles,
      required this.prospects,
      required this.objectives})
      : _articles = articles;

  factory _$MonthlyStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyStatisticsImplFromJson(json);

  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final OrderStats orders;
  final List<ArticleStats> _articles;
  @override
  List<ArticleStats> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final ProspectStats prospects;
  @override
  final ObjectiveStats objectives;

  @override
  String toString() {
    return 'MonthlyStatistics(periodStart: $periodStart, periodEnd: $periodEnd, orders: $orders, articles: $articles, prospects: $prospects, objectives: $objectives)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyStatisticsImpl &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.prospects, prospects) ||
                other.prospects == prospects) &&
            (identical(other.objectives, objectives) ||
                other.objectives == objectives));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, periodStart, periodEnd, orders,
      const DeepCollectionEquality().hash(_articles), prospects, objectives);

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyStatisticsImplCopyWith<_$MonthlyStatisticsImpl> get copyWith =>
      __$$MonthlyStatisticsImplCopyWithImpl<_$MonthlyStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyStatisticsImplToJson(
      this,
    );
  }
}

abstract class _MonthlyStatistics implements MonthlyStatistics {
  const factory _MonthlyStatistics(
      {required final DateTime periodStart,
      required final DateTime periodEnd,
      required final OrderStats orders,
      required final List<ArticleStats> articles,
      required final ProspectStats prospects,
      required final ObjectiveStats objectives}) = _$MonthlyStatisticsImpl;

  factory _MonthlyStatistics.fromJson(Map<String, dynamic> json) =
      _$MonthlyStatisticsImpl.fromJson;

  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  OrderStats get orders;
  @override
  List<ArticleStats> get articles;
  @override
  ProspectStats get prospects;
  @override
  ObjectiveStats get objectives;

  /// Create a copy of MonthlyStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyStatisticsImplCopyWith<_$MonthlyStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStats _$OrderStatsFromJson(Map<String, dynamic> json) {
  return _OrderStats.fromJson(json);
}

/// @nodoc
mixin _$OrderStats {
  int get validatedOrders => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  String get percentage => throw _privateConstructorUsedError;

  /// Serializes this OrderStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatsCopyWith<OrderStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatsCopyWith<$Res> {
  factory $OrderStatsCopyWith(
          OrderStats value, $Res Function(OrderStats) then) =
      _$OrderStatsCopyWithImpl<$Res, OrderStats>;
  @useResult
  $Res call({int validatedOrders, int totalOrders, String percentage});
}

/// @nodoc
class _$OrderStatsCopyWithImpl<$Res, $Val extends OrderStats>
    implements $OrderStatsCopyWith<$Res> {
  _$OrderStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validatedOrders = null,
    Object? totalOrders = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      validatedOrders: null == validatedOrders
          ? _value.validatedOrders
          : validatedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatsImplCopyWith<$Res>
    implements $OrderStatsCopyWith<$Res> {
  factory _$$OrderStatsImplCopyWith(
          _$OrderStatsImpl value, $Res Function(_$OrderStatsImpl) then) =
      __$$OrderStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int validatedOrders, int totalOrders, String percentage});
}

/// @nodoc
class __$$OrderStatsImplCopyWithImpl<$Res>
    extends _$OrderStatsCopyWithImpl<$Res, _$OrderStatsImpl>
    implements _$$OrderStatsImplCopyWith<$Res> {
  __$$OrderStatsImplCopyWithImpl(
      _$OrderStatsImpl _value, $Res Function(_$OrderStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validatedOrders = null,
    Object? totalOrders = null,
    Object? percentage = null,
  }) {
    return _then(_$OrderStatsImpl(
      validatedOrders: null == validatedOrders
          ? _value.validatedOrders
          : validatedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatsImpl implements _OrderStats {
  const _$OrderStatsImpl(
      {required this.validatedOrders,
      required this.totalOrders,
      required this.percentage});

  factory _$OrderStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatsImplFromJson(json);

  @override
  final int validatedOrders;
  @override
  final int totalOrders;
  @override
  final String percentage;

  @override
  String toString() {
    return 'OrderStats(validatedOrders: $validatedOrders, totalOrders: $totalOrders, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatsImpl &&
            (identical(other.validatedOrders, validatedOrders) ||
                other.validatedOrders == validatedOrders) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, validatedOrders, totalOrders, percentage);

  /// Create a copy of OrderStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatsImplCopyWith<_$OrderStatsImpl> get copyWith =>
      __$$OrderStatsImplCopyWithImpl<_$OrderStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatsImplToJson(
      this,
    );
  }
}

abstract class _OrderStats implements OrderStats {
  const factory _OrderStats(
      {required final int validatedOrders,
      required final int totalOrders,
      required final String percentage}) = _$OrderStatsImpl;

  factory _OrderStats.fromJson(Map<String, dynamic> json) =
      _$OrderStatsImpl.fromJson;

  @override
  int get validatedOrders;
  @override
  int get totalOrders;
  @override
  String get percentage;

  /// Create a copy of OrderStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStatsImplCopyWith<_$OrderStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleStats _$ArticleStatsFromJson(Map<String, dynamic> json) {
  return _ArticleStats.fromJson(json);
}

/// @nodoc
mixin _$ArticleStats {
  String get articleCode => throw _privateConstructorUsedError;
  String get articleName => throw _privateConstructorUsedError;
  int get achieved => throw _privateConstructorUsedError;
  int get objective => throw _privateConstructorUsedError;
  String get percentage => throw _privateConstructorUsedError;

  /// Serializes this ArticleStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArticleStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleStatsCopyWith<ArticleStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleStatsCopyWith<$Res> {
  factory $ArticleStatsCopyWith(
          ArticleStats value, $Res Function(ArticleStats) then) =
      _$ArticleStatsCopyWithImpl<$Res, ArticleStats>;
  @useResult
  $Res call(
      {String articleCode,
      String articleName,
      int achieved,
      int objective,
      String percentage});
}

/// @nodoc
class _$ArticleStatsCopyWithImpl<$Res, $Val extends ArticleStats>
    implements $ArticleStatsCopyWith<$Res> {
  _$ArticleStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCode = null,
    Object? articleName = null,
    Object? achieved = null,
    Object? objective = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      articleCode: null == articleCode
          ? _value.articleCode
          : articleCode // ignore: cast_nullable_to_non_nullable
              as String,
      articleName: null == articleName
          ? _value.articleName
          : articleName // ignore: cast_nullable_to_non_nullable
              as String,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as int,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleStatsImplCopyWith<$Res>
    implements $ArticleStatsCopyWith<$Res> {
  factory _$$ArticleStatsImplCopyWith(
          _$ArticleStatsImpl value, $Res Function(_$ArticleStatsImpl) then) =
      __$$ArticleStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String articleCode,
      String articleName,
      int achieved,
      int objective,
      String percentage});
}

/// @nodoc
class __$$ArticleStatsImplCopyWithImpl<$Res>
    extends _$ArticleStatsCopyWithImpl<$Res, _$ArticleStatsImpl>
    implements _$$ArticleStatsImplCopyWith<$Res> {
  __$$ArticleStatsImplCopyWithImpl(
      _$ArticleStatsImpl _value, $Res Function(_$ArticleStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCode = null,
    Object? articleName = null,
    Object? achieved = null,
    Object? objective = null,
    Object? percentage = null,
  }) {
    return _then(_$ArticleStatsImpl(
      articleCode: null == articleCode
          ? _value.articleCode
          : articleCode // ignore: cast_nullable_to_non_nullable
              as String,
      articleName: null == articleName
          ? _value.articleName
          : articleName // ignore: cast_nullable_to_non_nullable
              as String,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as int,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleStatsImpl implements _ArticleStats {
  const _$ArticleStatsImpl(
      {required this.articleCode,
      required this.articleName,
      required this.achieved,
      required this.objective,
      required this.percentage});

  factory _$ArticleStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleStatsImplFromJson(json);

  @override
  final String articleCode;
  @override
  final String articleName;
  @override
  final int achieved;
  @override
  final int objective;
  @override
  final String percentage;

  @override
  String toString() {
    return 'ArticleStats(articleCode: $articleCode, articleName: $articleName, achieved: $achieved, objective: $objective, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleStatsImpl &&
            (identical(other.articleCode, articleCode) ||
                other.articleCode == articleCode) &&
            (identical(other.articleName, articleName) ||
                other.articleName == articleName) &&
            (identical(other.achieved, achieved) ||
                other.achieved == achieved) &&
            (identical(other.objective, objective) ||
                other.objective == objective) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, articleCode, articleName, achieved, objective, percentage);

  /// Create a copy of ArticleStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleStatsImplCopyWith<_$ArticleStatsImpl> get copyWith =>
      __$$ArticleStatsImplCopyWithImpl<_$ArticleStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleStatsImplToJson(
      this,
    );
  }
}

abstract class _ArticleStats implements ArticleStats {
  const factory _ArticleStats(
      {required final String articleCode,
      required final String articleName,
      required final int achieved,
      required final int objective,
      required final String percentage}) = _$ArticleStatsImpl;

  factory _ArticleStats.fromJson(Map<String, dynamic> json) =
      _$ArticleStatsImpl.fromJson;

  @override
  String get articleCode;
  @override
  String get articleName;
  @override
  int get achieved;
  @override
  int get objective;
  @override
  String get percentage;

  /// Create a copy of ArticleStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleStatsImplCopyWith<_$ArticleStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProspectStats _$ProspectStatsFromJson(Map<String, dynamic> json) {
  return _ProspectStats.fromJson(json);
}

/// @nodoc
mixin _$ProspectStats {
  int get validatedProspects => throw _privateConstructorUsedError;
  int get totalProspects => throw _privateConstructorUsedError;
  String get percentage => throw _privateConstructorUsedError;

  /// Serializes this ProspectStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProspectStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProspectStatsCopyWith<ProspectStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProspectStatsCopyWith<$Res> {
  factory $ProspectStatsCopyWith(
          ProspectStats value, $Res Function(ProspectStats) then) =
      _$ProspectStatsCopyWithImpl<$Res, ProspectStats>;
  @useResult
  $Res call({int validatedProspects, int totalProspects, String percentage});
}

/// @nodoc
class _$ProspectStatsCopyWithImpl<$Res, $Val extends ProspectStats>
    implements $ProspectStatsCopyWith<$Res> {
  _$ProspectStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProspectStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validatedProspects = null,
    Object? totalProspects = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      validatedProspects: null == validatedProspects
          ? _value.validatedProspects
          : validatedProspects // ignore: cast_nullable_to_non_nullable
              as int,
      totalProspects: null == totalProspects
          ? _value.totalProspects
          : totalProspects // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProspectStatsImplCopyWith<$Res>
    implements $ProspectStatsCopyWith<$Res> {
  factory _$$ProspectStatsImplCopyWith(
          _$ProspectStatsImpl value, $Res Function(_$ProspectStatsImpl) then) =
      __$$ProspectStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int validatedProspects, int totalProspects, String percentage});
}

/// @nodoc
class __$$ProspectStatsImplCopyWithImpl<$Res>
    extends _$ProspectStatsCopyWithImpl<$Res, _$ProspectStatsImpl>
    implements _$$ProspectStatsImplCopyWith<$Res> {
  __$$ProspectStatsImplCopyWithImpl(
      _$ProspectStatsImpl _value, $Res Function(_$ProspectStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProspectStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validatedProspects = null,
    Object? totalProspects = null,
    Object? percentage = null,
  }) {
    return _then(_$ProspectStatsImpl(
      validatedProspects: null == validatedProspects
          ? _value.validatedProspects
          : validatedProspects // ignore: cast_nullable_to_non_nullable
              as int,
      totalProspects: null == totalProspects
          ? _value.totalProspects
          : totalProspects // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProspectStatsImpl implements _ProspectStats {
  const _$ProspectStatsImpl(
      {required this.validatedProspects,
      required this.totalProspects,
      required this.percentage});

  factory _$ProspectStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProspectStatsImplFromJson(json);

  @override
  final int validatedProspects;
  @override
  final int totalProspects;
  @override
  final String percentage;

  @override
  String toString() {
    return 'ProspectStats(validatedProspects: $validatedProspects, totalProspects: $totalProspects, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProspectStatsImpl &&
            (identical(other.validatedProspects, validatedProspects) ||
                other.validatedProspects == validatedProspects) &&
            (identical(other.totalProspects, totalProspects) ||
                other.totalProspects == totalProspects) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, validatedProspects, totalProspects, percentage);

  /// Create a copy of ProspectStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProspectStatsImplCopyWith<_$ProspectStatsImpl> get copyWith =>
      __$$ProspectStatsImplCopyWithImpl<_$ProspectStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProspectStatsImplToJson(
      this,
    );
  }
}

abstract class _ProspectStats implements ProspectStats {
  const factory _ProspectStats(
      {required final int validatedProspects,
      required final int totalProspects,
      required final String percentage}) = _$ProspectStatsImpl;

  factory _ProspectStats.fromJson(Map<String, dynamic> json) =
      _$ProspectStatsImpl.fromJson;

  @override
  int get validatedProspects;
  @override
  int get totalProspects;
  @override
  String get percentage;

  /// Create a copy of ProspectStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProspectStatsImplCopyWith<_$ProspectStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ObjectiveStats _$ObjectiveStatsFromJson(Map<String, dynamic> json) {
  return _ObjectiveStats.fromJson(json);
}

/// @nodoc
mixin _$ObjectiveStats {
  double get caObjective => throw _privateConstructorUsedError;
  double get recObjective => throw _privateConstructorUsedError;
  double get caAchieved => throw _privateConstructorUsedError;
  double get recAchieved => throw _privateConstructorUsedError;
  String get caPercentage => throw _privateConstructorUsedError;
  String get recPercentage => throw _privateConstructorUsedError;

  /// Serializes this ObjectiveStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ObjectiveStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ObjectiveStatsCopyWith<ObjectiveStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectiveStatsCopyWith<$Res> {
  factory $ObjectiveStatsCopyWith(
          ObjectiveStats value, $Res Function(ObjectiveStats) then) =
      _$ObjectiveStatsCopyWithImpl<$Res, ObjectiveStats>;
  @useResult
  $Res call(
      {double caObjective,
      double recObjective,
      double caAchieved,
      double recAchieved,
      String caPercentage,
      String recPercentage});
}

/// @nodoc
class _$ObjectiveStatsCopyWithImpl<$Res, $Val extends ObjectiveStats>
    implements $ObjectiveStatsCopyWith<$Res> {
  _$ObjectiveStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ObjectiveStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caObjective = null,
    Object? recObjective = null,
    Object? caAchieved = null,
    Object? recAchieved = null,
    Object? caPercentage = null,
    Object? recPercentage = null,
  }) {
    return _then(_value.copyWith(
      caObjective: null == caObjective
          ? _value.caObjective
          : caObjective // ignore: cast_nullable_to_non_nullable
              as double,
      recObjective: null == recObjective
          ? _value.recObjective
          : recObjective // ignore: cast_nullable_to_non_nullable
              as double,
      caAchieved: null == caAchieved
          ? _value.caAchieved
          : caAchieved // ignore: cast_nullable_to_non_nullable
              as double,
      recAchieved: null == recAchieved
          ? _value.recAchieved
          : recAchieved // ignore: cast_nullable_to_non_nullable
              as double,
      caPercentage: null == caPercentage
          ? _value.caPercentage
          : caPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      recPercentage: null == recPercentage
          ? _value.recPercentage
          : recPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObjectiveStatsImplCopyWith<$Res>
    implements $ObjectiveStatsCopyWith<$Res> {
  factory _$$ObjectiveStatsImplCopyWith(_$ObjectiveStatsImpl value,
          $Res Function(_$ObjectiveStatsImpl) then) =
      __$$ObjectiveStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double caObjective,
      double recObjective,
      double caAchieved,
      double recAchieved,
      String caPercentage,
      String recPercentage});
}

/// @nodoc
class __$$ObjectiveStatsImplCopyWithImpl<$Res>
    extends _$ObjectiveStatsCopyWithImpl<$Res, _$ObjectiveStatsImpl>
    implements _$$ObjectiveStatsImplCopyWith<$Res> {
  __$$ObjectiveStatsImplCopyWithImpl(
      _$ObjectiveStatsImpl _value, $Res Function(_$ObjectiveStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ObjectiveStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caObjective = null,
    Object? recObjective = null,
    Object? caAchieved = null,
    Object? recAchieved = null,
    Object? caPercentage = null,
    Object? recPercentage = null,
  }) {
    return _then(_$ObjectiveStatsImpl(
      caObjective: null == caObjective
          ? _value.caObjective
          : caObjective // ignore: cast_nullable_to_non_nullable
              as double,
      recObjective: null == recObjective
          ? _value.recObjective
          : recObjective // ignore: cast_nullable_to_non_nullable
              as double,
      caAchieved: null == caAchieved
          ? _value.caAchieved
          : caAchieved // ignore: cast_nullable_to_non_nullable
              as double,
      recAchieved: null == recAchieved
          ? _value.recAchieved
          : recAchieved // ignore: cast_nullable_to_non_nullable
              as double,
      caPercentage: null == caPercentage
          ? _value.caPercentage
          : caPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      recPercentage: null == recPercentage
          ? _value.recPercentage
          : recPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObjectiveStatsImpl implements _ObjectiveStats {
  const _$ObjectiveStatsImpl(
      {required this.caObjective,
      required this.recObjective,
      required this.caAchieved,
      required this.recAchieved,
      required this.caPercentage,
      required this.recPercentage});

  factory _$ObjectiveStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObjectiveStatsImplFromJson(json);

  @override
  final double caObjective;
  @override
  final double recObjective;
  @override
  final double caAchieved;
  @override
  final double recAchieved;
  @override
  final String caPercentage;
  @override
  final String recPercentage;

  @override
  String toString() {
    return 'ObjectiveStats(caObjective: $caObjective, recObjective: $recObjective, caAchieved: $caAchieved, recAchieved: $recAchieved, caPercentage: $caPercentage, recPercentage: $recPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectiveStatsImpl &&
            (identical(other.caObjective, caObjective) ||
                other.caObjective == caObjective) &&
            (identical(other.recObjective, recObjective) ||
                other.recObjective == recObjective) &&
            (identical(other.caAchieved, caAchieved) ||
                other.caAchieved == caAchieved) &&
            (identical(other.recAchieved, recAchieved) ||
                other.recAchieved == recAchieved) &&
            (identical(other.caPercentage, caPercentage) ||
                other.caPercentage == caPercentage) &&
            (identical(other.recPercentage, recPercentage) ||
                other.recPercentage == recPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, caObjective, recObjective,
      caAchieved, recAchieved, caPercentage, recPercentage);

  /// Create a copy of ObjectiveStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectiveStatsImplCopyWith<_$ObjectiveStatsImpl> get copyWith =>
      __$$ObjectiveStatsImplCopyWithImpl<_$ObjectiveStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObjectiveStatsImplToJson(
      this,
    );
  }
}

abstract class _ObjectiveStats implements ObjectiveStats {
  const factory _ObjectiveStats(
      {required final double caObjective,
      required final double recObjective,
      required final double caAchieved,
      required final double recAchieved,
      required final String caPercentage,
      required final String recPercentage}) = _$ObjectiveStatsImpl;

  factory _ObjectiveStats.fromJson(Map<String, dynamic> json) =
      _$ObjectiveStatsImpl.fromJson;

  @override
  double get caObjective;
  @override
  double get recObjective;
  @override
  double get caAchieved;
  @override
  double get recAchieved;
  @override
  String get caPercentage;
  @override
  String get recPercentage;

  /// Create a copy of ObjectiveStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObjectiveStatsImplCopyWith<_$ObjectiveStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
