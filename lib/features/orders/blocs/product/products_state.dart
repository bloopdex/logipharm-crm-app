part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.loading() = _Loading;

  const factory ProductsState.loaded({required List<Product> products}) = _Loaded;

  const factory ProductsState.loadingMore({
    required List<Product> products,
  }) = _LoadingMore;

  const factory ProductsState.failure({required String message}) = _Failure;
}
