import 'package:crm/core/core.dart';
import 'package:crm/features/orders/blocs/product/products_cubit.dart';
import 'package:crm/features/orders/blocs/orders/orders_cubit.dart';
import 'package:crm/features/orders/blocs/order_details/order_details_cubit.dart';
import 'package:crm/features/orders/blocs/realization/realization_cubit.dart';
import 'package:crm/features/orders/widgets/medicament_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_screen.dart';
import 'my_orders_screen.dart';
import 'realization_stats_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ScrollController _scrollController = ScrollController();
  late ProductsCubit _productsCubit;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productsCubit = context.read<ProductsCubit>();

    if (_productsCubit.state.maybeWhen(
        orElse: () => true, loaded: (products) => products.isEmpty)) {
      _productsCubit.loadProducts(query: '');
    }

    // Listen to scroll events to load more products when reaching the bottom
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _productsCubit.loadMoreProducts(
          query: _searchController.text,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.products),
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            tooltip: 'My Orders',
            onPressed: () {
              context.push(
                MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => OrdersCubit()..load()),
                    BlocProvider(create: (_) => OrderDetailsCubit()),
                    BlocProvider(create: (_) => RealizationCubit()..load()),
                  ],
                  child: const MyOrdersScreen(),
                ),
              );
            },
          ),
          // Cart icon to navigate to cart page
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.push(CartScreen());
            },
          ),
          IconButton(
            icon: const Icon(Icons.insights),
            tooltip: 'Stats',
            onPressed: () {
              context.push(
                BlocProvider(
                  create: (_) => RealizationCubit(),
                  child: const RealizationStatsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd1),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: context.i10n.searchProducts,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _productsCubit.loadProducts(
                  query: value,
                );
              },
            ),
          ),
          SizedBox(height: kPaddingMd2),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (products) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _productsCubit.reset();
                        await _productsCubit.loadProducts(
                            query: _searchController.text);
                      },
                      child: ListView.separated(
                        key: const PageStorageKey('products_list'),
                        padding: EdgeInsets.symmetric(horizontal: kPaddingMd1),
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _scrollController,
                        itemCount: products.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: kPaddingSm3),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return MedicamentCard(medicament: product);
                        },
                      ),
                    );
                  },
                  loadingMore: (products) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _productsCubit.reset();
                        await _productsCubit.loadProducts(
                            query: _searchController.text);
                      },
                      child: ListView.separated(
                        key: const PageStorageKey('products_list'),
                        padding: EdgeInsets.symmetric(horizontal: kPaddingMd1),
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: products.length + 1,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: kPaddingSm3),
                        itemBuilder: (context, index) {
                          if (index == products.length) {
                            return const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          final product = products[index];
                          return MedicamentCard(medicament: product);
                        },
                      ),
                    );
                  },
                  failure: (message) => Center(
                    child: Padding(
                      padding: EdgeInsets.all(kPaddingLg1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Colors.red.shade300,
                          ),
                          SizedBox(height: kSpacingX5),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: kSpacingX5),
                          ElevatedButton.icon(
                            onPressed: () {
                              _productsCubit.loadProducts(
                                query: _searchController.text,
                              );
                            },
                            icon: const Icon(Icons.refresh),
                            label: Text(context.i10n.retry),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: kPaddingLg1,
                                vertical: kPaddingMd2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
