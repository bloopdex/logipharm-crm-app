part of 'products_cubit.dart';

@freezed
class OfferProductsState with _$OfferProductsState {
  const factory OfferProductsState.initial() = _Initial;
  const factory OfferProductsState.loading() = _Loading;
  const factory OfferProductsState.loaded(List<ProductDto> products) = _Loaded;
  const factory OfferProductsState.empty() = _Empty;
  const factory OfferProductsState.error(String message) = _Error;
}
