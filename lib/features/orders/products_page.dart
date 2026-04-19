import 'dart:typed_data';

import 'package:crm/core/core.dart';
import 'package:crm/features/orders/blocs/product/products_cubit.dart';
import 'package:crm/features/orders/blocs/orders/orders_cubit.dart';
import 'package:crm/features/orders/blocs/order_details/order_details_cubit.dart';
import 'package:crm/features/orders/blocs/realization/realization_cubit.dart';
import 'package:crm/features/orders/services/p_d_f_service.dart';
import 'package:crm/features/orders/services/product_service.dart';
import 'package:crm/features/orders/widgets/medicament_card.dart';
import 'package:dio/dio.dart';
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
  bool _isExportingProducts = false;

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

  Future<void> _exportProducts() async {
    if (_isExportingProducts) return;

    setState(() {
      _isExportingProducts = true;
    });

    try {
      final hasPermission = await PDFService.requestStoragePermission();
      if (!hasPermission) {
        if (mounted) {
          context.errorSnackBar(context.i10n.exportStoragePermissionRequired);
        }
        return;
      }

      final response = await ProductService.exportProductsPdf();
      if (response.statusCode != 200) {
        throw Exception('HTTP ${response.statusCode}');
      }

      final pdfBytes = _extractPdfBytes(response.data);
      if (pdfBytes.isEmpty) {
        if (mounted) {
          context.errorSnackBar(context.i10n.productsExportEmptyFile);
        }
        return;
      }

      final fileName = _resolveExportFileName(response.headers);
      final filePath = await PDFService.saveAndDownloadPDF(
        pdfBytes: pdfBytes,
        fileName: fileName,
      );

      if (!mounted) return;

      if (filePath == null) {
        context.errorSnackBar(context.i10n.productsExportFailed);
        return;
      }

      context.successSnackBar(context.i10n.productsExportSuccess);
      _showExportOptionsDialog(pdfBytes, fileName);
    } catch (e) {
      if (mounted) {
        context.errorSnackBar('${context.i10n.productsExportFailed}: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isExportingProducts = false;
        });
      }
    }
  }

  Uint8List _extractPdfBytes(dynamic data) {
    if (data is Uint8List) {
      return data;
    }

    if (data is List<int>) {
      return Uint8List.fromList(data);
    }

    if (data is List) {
      return Uint8List.fromList(data.cast<int>());
    }

    throw const FormatException('Unexpected PDF payload type');
  }

  String _resolveExportFileName(Headers headers) {
    final disposition = headers.value('content-disposition');

    if (disposition != null && disposition.isNotEmpty) {
      final encodedMatch = RegExp(
        r"filename\*=UTF-8''([^;]+)",
        caseSensitive: false,
      ).firstMatch(disposition);
      if (encodedMatch != null && encodedMatch.group(1) != null) {
        return Uri.decodeComponent(encodedMatch.group(1)!);
      }

      final plainMatch = RegExp(
        r'filename="?([^";]+)"?',
        caseSensitive: false,
      ).firstMatch(disposition);
      if (plainMatch != null && plainMatch.group(1) != null) {
        return plainMatch.group(1)!;
      }
    }

    return 'products_export_${DateTime.now().millisecondsSinceEpoch}.pdf';
  }

  void _showExportOptionsDialog(Uint8List pdfBytes, String fileName) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(context.i10n.exportProducts),
          content: Text(context.i10n.productsExportReady),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(context.i10n.closeAction),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await PDFService.printPDF(pdfBytes);
              },
              child: Text(context.i10n.printAction),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await PDFService.sharePDF(
                  pdfBytes: pdfBytes,
                  fileName: fileName,
                );
              },
              child: Text(context.i10n.shareAction),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.products),
        actions: [
          IconButton(
            icon: _isExportingProducts
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.picture_as_pdf_outlined),
            tooltip: _isExportingProducts
                ? context.i10n.exportingProducts
                : context.i10n.exportProducts,
            onPressed: _isExportingProducts ? null : _exportProducts,
          ),
          IconButton(
            icon: const Icon(Icons.list_alt),
            tooltip: context.i10n.myOrders,
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
