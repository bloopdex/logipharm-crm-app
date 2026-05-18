import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/core.dart';
import '../../shared/widgets/loading/loader.widget.dart';
import '../../shared/widgets/image/svg.dart';
import 'cubit/rotation_cubit.dart';

class ProductRotationPage extends StatefulWidget {
  static const String routeName = '/product-rotation';

  const ProductRotationPage({super.key});

  @override
  State<ProductRotationPage> createState() => _ProductRotationPageState();
}

class _ProductRotationPageState extends State<ProductRotationPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  final int _limit = 1000;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    // Default to current month
    final now = DateTime.now();
    _startDate = DateTime(now.year, now.month, 1);
    _endDate = DateTime(now.year, now.month, now.day);
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _loadData() {
    if (_startDate != null && _endDate != null) {
      context.read<RotationCubit>().loadProductRotation(
            startDate: _startDate!,
            endDate: _endDate!,
            limit: _limit,
            productName: _searchQuery.isEmpty ? null : _searchQuery,
          );
    }
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchQuery = value;
      });
      _loadData();
    });
  }

  Future<void> _selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
      initialDate: _startDate ?? DateTime.now(),
    );

    if (picked != null && mounted) {
      setState(() {
        _startDate = picked;
        if (_endDate != null && _startDate!.isAfter(_endDate!)) {
          _endDate = _startDate;
        }
      });
      _loadData();
    }
  }

  Future<void> _selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
      initialDate: _endDate ?? DateTime.now(),
    );

    if (picked != null && mounted) {
      setState(() {
        _endDate = picked;
        if (_startDate != null && _endDate!.isBefore(_startDate!)) {
          _startDate = _endDate;
        }
      });
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          context.i10n.productRotation,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: Column(
        children: [
          // Date Range Pickers Row
          Padding(
            padding: EdgeInsets.all(kPaddingMd2),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _selectStartDate,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kPaddingMd2,
                        vertical: kPaddingMd2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: kBorder3),
                        borderRadius: BorderRadius.circular(kSpacingX3),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, size: 18, color: kPrimaryColor),
                          SizedBox(width: kSpacingX2),
                          Expanded(
                            child: Text(
                              _startDate != null
                                  ? DateFormat('dd/MM/yyyy').format(_startDate!)
                                  : context.i10n.productRotationStartDate,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: kPrimaryColor),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: kSpacingX2),
                Expanded(
                  child: InkWell(
                    onTap: _selectEndDate,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kPaddingMd2,
                        vertical: kPaddingMd2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: kBorder3),
                        borderRadius: BorderRadius.circular(kSpacingX3),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, size: 18, color: kPrimaryColor),
                          SizedBox(width: kSpacingX2),
                          Expanded(
                            child: Text(
                              _endDate != null
                                  ? DateFormat('dd/MM/yyyy').format(_endDate!)
                                  : context.i10n.productRotationEndDate,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: kPrimaryColor),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: context.i10n.productRotationSearchHint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kSpacingX3),
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          SizedBox(height: kSpacingX2),
          // Results
          Expanded(
            child: BlocBuilder<RotationCubit, RotationState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: Loader()),
                  loading: () => const Center(child: Loader()),
                  loaded: (data) {
                    if (data.products.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SVG(
                              'empty-states/info.svg',
                              height: 175.h,
                            ),
                            SizedBox(height: kSpacingX3),
                            Text(
                              _searchQuery.isNotEmpty
                                  ? 'No products found for "${_searchQuery}"'
                                  : context.i10n.productRotationNoData,
                              style: context.textTheme.headlineMedium,
                            ),
                            SizedBox(height: kSpacingX2),
                            Text(
                              context.i10n.productRotationNoDataDescription,
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async => _loadData(),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                        itemCount: data.products.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final product = data.products[index];
                          return ListTile(
                            title: Text(
                              product.productName,
                              style: context.textTheme.bodyLarge,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: kPaddingSm3,
                                vertical: kPaddingSm2,
                              ),
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(kSpacingX3),
                              ),
                              child: Text(
                                '${product.totalQuantity.toStringAsFixed(0)} ${context.i10n.productRotationUnits}',
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  error: (message) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SVG(
                          'empty-states/info.svg',
                          height: 175.h,
                        ),
                        SizedBox(height: kSpacingX3),
                        Text(
                          context.i10n.productRotationError,
                          style: context.textTheme.headlineMedium,
                        ),
                        SizedBox(height: kSpacingX2),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium,
                        ),
                        SizedBox(height: kSpacingX4),
                        ElevatedButton(
                          onPressed: _loadData,
                          child: Text(context.i10n.productRotationRetry),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Summary Footer
          BlocBuilder<RotationCubit, RotationState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const SizedBox.shrink(),
                loaded: (data) {
                  if (data.products.isEmpty) return const SizedBox.shrink();
                  return Container(
                    padding: EdgeInsets.all(kPaddingMd2),
                    decoration: BoxDecoration(
                      color: kBgGrayVisibility1,
                      border: Border(top: BorderSide(color: kBorder3)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.i10n.productRotationTotalProducts} ${_searchQuery.isNotEmpty ? '(filtered)' : ''}',
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          '${data.totalProducts}',
                          style: context.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (_) => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }
}