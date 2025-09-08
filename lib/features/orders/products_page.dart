import 'package:crm/core/core.dart';
import 'package:crm/features/orders/blocs/product/products_cubit.dart';
import 'package:crm/features/orders/widgets/medicament_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_screen.dart';

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

    if (_productsCubit.state
        .maybeWhen(orElse: () => true, loaded: (products) => products.isEmpty)) {
      _productsCubit.loadProducts(query: '');
    }

    // Listen to scroll events to load more products when reaching the bottom
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
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
          // Cart icon to navigate to cart page
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.push(CartScreen());
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
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (products) => RefreshIndicator(
                    onRefresh: () async {
                      _productsCubit.reset();
                      await _productsCubit.loadProducts(query: _searchController.text);
                    },
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: kPaddingMd1),
                      physics: AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      itemCount: products.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(height: kPaddingSm3),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return MedicamentCard(medicament: product);
                      },
                    ),
                  ),
                  loadingMore: (products) => RefreshIndicator(
                    onRefresh: () async {
                      _productsCubit.reset();
                      await _productsCubit.loadProducts(query: _searchController.text);
                    },
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: kPaddingMd1),
                      physics: AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      itemCount: products.length + 1,
                      // Add one more item for the loading indicator
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(height: kPaddingSm3),
                      itemBuilder: (context, index) {
                        if (index == products.length) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        final product = products[index];
                        return MedicamentCard(medicament: product);
                      },
                    ),
                  ),
                  failure: (message) => Center(child: Text(message)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
