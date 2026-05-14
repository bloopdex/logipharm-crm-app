part of 'product_rotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductRotationPeriod _$ProductRotationPeriodFromJson(
    Map<String, dynamic> json) {
  return _ProductRotationPeriod.fromJson(json);
}

/// @nodoc
mixin _$ProductRotationPeriod {
  @JsonKey(name: 'startDate')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  String get endDate => throw _privateConstructorUsedError;

  /// Serializes this ProductRotationPeriod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductRotationPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductRotationPeriodCopyWith<ProductRotationPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRotationPeriodCopyWith<$Res> {
  factory $ProductRotationPeriodCopyWith(ProductRotationPeriod value,
          $Res Function(ProductRotationPeriod) then) =
      _$ProductRotationPeriodCopyWithImpl<$Res, ProductRotationPeriod>;
  @useResult
  $Res call(
      {@JsonKey(name: 'startDate') String startDate,
      @JsonKey(name: 'endDate') String endDate});
}

/// @nodoc
class _$ProductRotationPeriodCopyWithImpl<$Res,
        $Val extends ProductRotationPeriod>
    implements $ProductRotationPeriodCopyWith<$Res> {
  _$ProductRotationPeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRotationPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductRotationPeriodImplCopyWith<$Res>
    implements $ProductRotationPeriodCopyWith<$Res> {
  factory _$$ProductRotationPeriodImplCopyWith(
          _$ProductRotationPeriodImpl value,
          $Res Function(_$ProductRotationPeriodImpl) then) =
      __$$ProductRotationPeriodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'startDate') String startDate,
      @JsonKey(name: 'endDate') String endDate});
}

/// @nodoc
class __$$ProductRotationPeriodImplCopyWithImpl<$Res>
    extends _$ProductRotationPeriodCopyWithImpl<$Res,
        _$ProductRotationPeriodImpl>
    implements _$$ProductRotationPeriodImplCopyWith<$Res> {
  __$$ProductRotationPeriodImplCopyWithImpl(_$ProductRotationPeriodImpl _value,
      $Res Function(_$ProductRotationPeriodImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRotationPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$ProductRotationPeriodImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRotationPeriodImpl implements _ProductRotationPeriod {
  const _$ProductRotationPeriodImpl(
      {@JsonKey(name: 'startDate') required this.startDate,
      @JsonKey(name: 'endDate') required this.endDate});

  factory _$ProductRotationPeriodImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRotationPeriodImplFromJson(json);

  @override
  @JsonKey(name: 'startDate')
  final String startDate;
  @override
  @JsonKey(name: 'endDate')
  final String endDate;

  @override
  String toString() {
    return 'ProductRotationPeriod(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRotationPeriodImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of ProductRotationPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRotationPeriodImplCopyWith<_$ProductRotationPeriodImpl>
      get copyWith => __$$ProductRotationPeriodImplCopyWithImpl<
          _$ProductRotationPeriodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRotationPeriodImplToJson(
      this,
    );
  }
}

abstract class _ProductRotationPeriod implements ProductRotationPeriod {
  const factory _ProductRotationPeriod(
          {@JsonKey(name: 'startDate') required final String startDate,
          @JsonKey(name: 'endDate') required final String endDate}) =
      _$ProductRotationPeriodImpl;

  factory _ProductRotationPeriod.fromJson(Map<String, dynamic> json) =
      _$ProductRotationPeriodImpl.fromJson;

  @override
  @JsonKey(name: 'startDate')
  String get startDate;
  @override
  @JsonKey(name: 'endDate')
  String get endDate;

  /// Create a copy of ProductRotationPeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductRotationPeriodImplCopyWith<_$ProductRotationPeriodImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProductRotationItem _$ProductRotationItemFromJson(Map<String, dynamic> json) {
  return _ProductRotationItem.fromJson(json);
}

/// @nodoc
mixin _$ProductRotationItem {
  @JsonKey(name: 'productName')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalQuantity')
  double get totalQuantity => throw _privateConstructorUsedError;

  /// Serializes this ProductRotationItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductRotationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductRotationItemCopyWith<ProductRotationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRotationItemCopyWith<$Res> {
  factory $ProductRotationItemCopyWith(
          ProductRotationItem value, $Res Function(ProductRotationItem) then) =
      _$ProductRotationItemCopyWithImpl<$Res, ProductRotationItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'productName') String productName,
      @JsonKey(name: 'totalQuantity') double totalQuantity});
}

/// @nodoc
class _$ProductRotationItemCopyWithImpl<$Res, $Val extends ProductRotationItem>
    implements $ProductRotationItemCopyWith<$Res> {
  _$ProductRotationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRotationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? totalQuantity = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductRotationItemImplCopyWith<$Res>
    implements $ProductRotationItemCopyWith<$Res> {
  factory _$$ProductRotationItemImplCopyWith(_$ProductRotationItemImpl value,
          $Res Function(_$ProductRotationItemImpl) then) =
      __$$ProductRotationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productName') String productName,
      @JsonKey(name: 'totalQuantity') double totalQuantity});
}

/// @nodoc
class __$$ProductRotationItemImplCopyWithImpl<$Res>
    extends _$ProductRotationItemCopyWithImpl<$Res, _$ProductRotationItemImpl>
    implements _$$ProductRotationItemImplCopyWith<$Res> {
  __$$ProductRotationItemImplCopyWithImpl(_$ProductRotationItemImpl _value,
      $Res Function(_$ProductRotationItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRotationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? totalQuantity = null,
  }) {
    return _then(_$ProductRotationItemImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRotationItemImpl implements _ProductRotationItem {
  const _$ProductRotationItemImpl(
      {@JsonKey(name: 'productName') required this.productName,
      @JsonKey(name: 'totalQuantity') required this.totalQuantity});

  factory _$ProductRotationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRotationItemImplFromJson(json);

  @override
  @JsonKey(name: 'productName')
  final String productName;
  @override
  @JsonKey(name: 'totalQuantity')
  final double totalQuantity;

  @override
  String toString() {
    return 'ProductRotationItem(productName: $productName, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRotationItemImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productName, totalQuantity);

  /// Create a copy of ProductRotationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRotationItemImplCopyWith<_$ProductRotationItemImpl> get copyWith =>
      __$$ProductRotationItemImplCopyWithImpl<_$ProductRotationItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRotationItemImplToJson(
      this,
    );
  }
}

abstract class _ProductRotationItem implements ProductRotationItem {
  const factory _ProductRotationItem(
      {@JsonKey(name: 'productName') required final String productName,
      @JsonKey(name: 'totalQuantity')
      required final double totalQuantity}) = _$ProductRotationItemImpl;

  factory _ProductRotationItem.fromJson(Map<String, dynamic> json) =
      _$ProductRotationItemImpl.fromJson;

  @override
  @JsonKey(name: 'productName')
  String get productName;
  @override
  @JsonKey(name: 'totalQuantity')
  double get totalQuantity;

  /// Create a copy of ProductRotationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductRotationItemImplCopyWith<_$ProductRotationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductRotationResponse _$ProductRotationResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductRotationResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductRotationResponse {
  @JsonKey(name: 'period')
  ProductRotationPeriod get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalProducts')
  int get totalProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'products')
  List<ProductRotationItem> get products => throw _privateConstructorUsedError;

  /// Serializes this ProductRotationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductRotationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductRotationResponseCopyWith<ProductRotationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRotationResponseCopyWith<$Res> {
  factory $ProductRotationResponseCopyWith(ProductRotationResponse value,
          $Res Function(ProductRotationResponse) then) =
      _$ProductRotationResponseCopyWithImpl<$Res, ProductRotationResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'period') ProductRotationPeriod period,
      @JsonKey(name: 'totalProducts') int totalProducts,
      @JsonKey(name: 'products') List<ProductRotationItem> products});

  $ProductRotationPeriodCopyWith<$Res> get period;
}

/// @nodoc
class _$ProductRotationResponseCopyWithImpl<$Res,
        $Val extends ProductRotationResponse>
    implements $ProductRotationResponseCopyWith<$Res> {
  _$ProductRotationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRotationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? totalProducts = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ProductRotationPeriod,
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductRotationItem>,
    ) as $Val);
  }

  /// Create a copy of ProductRotationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRotationPeriodCopyWith<$Res> get period {
    return $ProductRotationPeriodCopyWith<$Res>(_value.period, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductRotationResponseImplCopyWith<$Res>
    implements $ProductRotationResponseCopyWith<$Res> {
  factory _$$ProductRotationResponseImplCopyWith(
          _$ProductRotationResponseImpl value,
          $Res Function(_$ProductRotationResponseImpl) then) =
      __$$ProductRotationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'period') ProductRotationPeriod period,
      @JsonKey(name: 'totalProducts') int totalProducts,
      @JsonKey(name: 'products') List<ProductRotationItem> products});

  @override
  $ProductRotationPeriodCopyWith<$Res> get period;
}

/// @nodoc
class __$$ProductRotationResponseImplCopyWithImpl<$Res>
    extends _$ProductRotationResponseCopyWithImpl<$Res,
        _$ProductRotationResponseImpl>
    implements _$$ProductRotationResponseImplCopyWith<$Res> {
  __$$ProductRotationResponseImplCopyWithImpl(
      _$ProductRotationResponseImpl _value,
      $Res Function(_$ProductRotationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRotationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? totalProducts = null,
    Object? products = null,
  }) {
    return _then(_$ProductRotationResponseImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ProductRotationPeriod,
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductRotationItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRotationResponseImpl implements _ProductRotationResponse {
  const _$ProductRotationResponseImpl(
      {@JsonKey(name: 'period') required this.period,
      @JsonKey(name: 'totalProducts') required this.totalProducts,
      @JsonKey(name: 'products')
      required final List<ProductRotationItem> products})
      : _products = products;

  factory _$ProductRotationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRotationResponseImplFromJson(json);

  @override
  @JsonKey(name: 'period')
  final ProductRotationPeriod period;
  @override
  @JsonKey(name: 'totalProducts')
  final int totalProducts;
  final List<ProductRotationItem> _products;
  @override
  @JsonKey(name: 'products')
  List<ProductRotationItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductRotationResponse(period: $period, totalProducts: $totalProducts, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRotationResponseImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, period, totalProducts,
      const DeepCollectionEquality().hash(_products));

  /// Create a copy of ProductRotationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRotationResponseImplCopyWith<_$ProductRotationResponseImpl>
      get copyWith => __$$ProductRotationResponseImplCopyWithImpl<
          _$ProductRotationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRotationResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductRotationResponse implements ProductRotationResponse {
  const factory _ProductRotationResponse(
          {@JsonKey(name: 'period') required final ProductRotationPeriod period,
          @JsonKey(name: 'totalProducts') required final int totalProducts,
          @JsonKey(name: 'products')
          required final List<ProductRotationItem> products}) =
      _$ProductRotationResponseImpl;

  factory _ProductRotationResponse.fromJson(Map<String, dynamic> json) =
      _$ProductRotationResponseImpl.fromJson;

  @override
  @JsonKey(name: 'period')
  ProductRotationPeriod get period;
  @override
  @JsonKey(name: 'totalProducts')
  int get totalProducts;
  @override
  @JsonKey(name: 'products')
  List<ProductRotationItem> get products;

  /// Create a copy of ProductRotationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductRotationResponseImplCopyWith<_$ProductRotationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
