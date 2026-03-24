import 'package:bloc/bloc.dart';
import 'package:crm/core/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/product/product.dart';
import '../../services/product_service.dart';

part 'products_cubit.freezed.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsState.initial());

  int _page = -1;
  final int _pageSize = 20;
  final List<Product> _products = [];

  Future<void> loadProducts({
    String? query,
  }) async {
    emit(const ProductsState.loading());
    try {
      final response = await ProductService.searchProducts(
        page: 0,
        size: _pageSize,
        query: query,
      );

      _page = 0;

      ILogger.info('Products loaded: ${response.data}');

      final contentList = response.data['content'];
      if (contentList == null || contentList is! List) {
        emit(ProductsState.failure(
            message: 'Invalid product data format, response data: ${response.data}'));
        return;
      }

      final List<Product> newProducts = contentList
          .map<Product?>((product) {
            try {
              return product != null
                  ? Product.fromJson(product as Map<String, dynamic>)
                  : null;
            } catch (e) {
              ILogger.error('Failed to parse product: $e');
              return null;
            }
          })
          .whereType<Product>()
          .toList();

      _products.clear();
      _products.addAll(newProducts);

      emit(ProductsState.loaded(products: _products));
    } catch (e) {
      ILogger.error('Failed to load products $e');
      emit(ProductsState.failure(message: 'Failed to load products $e'));
    }
  }

  Future<void> loadMoreProducts({
    String? query,
  }) async {
    ILogger.info('Loading more products, current page: $_page');
    if (_page >= 0) {
      try {
        emit(ProductsState.loadingMore(products: _products));
        final response = await ProductService.searchProducts(
          page: ++_page,
          size: _pageSize,
          query: query,
        );

        final contentList = response.data['content'];
        if (contentList == null || contentList is! List) {
          emit(const ProductsState.failure(
              message: 'Invalid product data format'));
          return;
        }

        final List<Product> newProducts = contentList
            .map<Product?>((product) {
              try {
                return product != null
                    ? Product.fromJson(product as Map<String, dynamic>)
                    : null;
              } catch (e) {
                ILogger.error('Failed to parse product: $e');
                return null;
              }
            })
            .whereType<Product>()
            .toList();

        ILogger.info('More products loaded: ${newProducts.length}');
        _products.addAll(newProducts);
        ILogger.info('Total products: ${_products.length}');
        emit(ProductsState.loaded(products: _products));
      } catch (e) {
        emit(const ProductsState.failure(
            message: 'Failed to load more products'));
      }
    }
  }

  void reset() {
    _page = -1;
    _products.clear();
    emit(const ProductsState.initial());
  }
}
