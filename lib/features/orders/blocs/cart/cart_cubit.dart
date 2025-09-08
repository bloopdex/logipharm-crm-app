import 'package:bloc/bloc.dart';
import 'package:crm/core/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/cart/cart_item.dart';
import '../../services/cart_service.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  int _page = -1;
  final int _pageSize = 200;
  final List<CartItem> _cartItems = [];

  Future<void> loadCart() async {
    _cartItems.clear();
    emit(const CartState.loading());
    try {
      final response = await CartService.getCart(page: ++_page, size: _pageSize);

      final List<CartItem> newCartItems =
          (response.data as List).map<CartItem>((item) => CartItem.fromJson(item)).toList();

      _cartItems.addAll(newCartItems);
      emit(CartState.loaded(
        cartItems: _cartItems,
        totalAmount: newCartItems.fold<double>(
          0.0,
          (sum, item) => sum + (item.montant ?? 0),
        ),
        totalElements: newCartItems.length,
      ));
    } catch (e) {
      ILogger.error('Failed to load cart: $e');
      emit(const CartState.failure(message: 'Failed to load cart'));
    }
  }

  Future<void> loadMoreCart() async {
    if (_page >= 0) {
      emit(const CartState.loading());
      try {
        final response = await CartService.getCart(page: ++_page, size: _pageSize);

        final List<CartItem> newCartItems = (response.data['body']['content'] as List)
            .map<CartItem>((item) => CartItem.fromJson(item))
            .toList();

        _cartItems.addAll(newCartItems);
        emit(CartState.loaded(
          cartItems: _cartItems,
          totalAmount: _cartItems.fold<double>(
            0.0,
            (sum, item) => sum + (item.montant ?? 0),
          ),
          totalElements: _cartItems.length,
        ));
      } catch (e) {
        emit(const CartState.failure(message: 'Failed to load more cart items'));
      }
    }
  }

  Future<void> addItemToCart(Map<String, dynamic> data) async {
    emit(const CartState.loading());
    try {
      await CartService.addItemToCart(data: data);
      // Refresh cart after adding
      _page = 0;
      _cartItems.clear();
      await loadCart();
    } catch (e) {
      emit(const CartState.failure(message: 'Failed to add item to cart'));
    }
  }

  Future<void> deleteItemFromCart(Map<String, dynamic> data) async {
    emit(const CartState.loading());
    try {
      await CartService.deleteItemFromCart(data: data);
      // Refresh cart after deleting
      _page = 0;
      _cartItems.clear();
      await loadCart();
    } catch (e) {
      emit(const CartState.failure(message: 'Failed to delete item from cart'));
    }
  }

  Future<void> validateCart(Map<String, dynamic> data) async {
    emit(const CartState.loading());
    try {
      await CartService.validateCart(data: data);
      // Refresh cart after validation
      _page = 0;
      _cartItems.clear();
      await loadCart();
    } catch (e) {
      emit(const CartState.failure(message: 'Failed to validate cart'));
    }
  }

  void reset() {
    _page = 0;
    _cartItems.clear();
    emit(const CartState.initial());
  }
}
