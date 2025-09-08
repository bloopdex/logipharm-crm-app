part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded({
    required List<CartItem> cartItems,
    required double totalAmount,
    required int totalElements,
    String? tempErr,
  }) = _Loaded;
  const factory CartState.failure({required String message}) = _Failure;
}
