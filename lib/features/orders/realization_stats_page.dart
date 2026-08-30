import 'package:collection/collection.dart';
import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'blocs/realization/realization_cubit.dart';
import 'models/order/realization.dart';

class RealizationStatsPage extends StatefulWidget {
  static const routeName = '/realization-stats';
  const RealizationStatsPage({super.key});

  @override
  State<RealizationStatsPage> createState() => _RealizationStatsPageState();
}

class _RealizationStatsPageState extends State<RealizationStatsPage> {
  late int _selectedYear;
  late int _selectedMonth;
  List<DelegateRealization> _list = const [];
  bool _loading = false;
  String? _error;

  // Aggregates
  int get totalObj => _list.fold(0, (p, e) => p + (e.qteObj ?? 0));
  int get totalVendue => _list.fold(0, (p, e) => p + e.qteVendue);
  int get totalOrders => _list.fold(0, (p, e) => p + e.nbrCde);
  double get avgTxReal => _list.isEmpty ? 0 : _list.map((e) => e.txReal).average;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedYear = now.year;
    _selectedMonth = now.month;
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    await context.read<RealizationCubit>().load(year: _selectedYear, month: _selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    final years = List<int>.generate(5, (i) => DateTime.now().year - i);
    final months = List<int>.generate(12, (i) => i + 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Realization Stats'),
        actions: [
          IconButton(
            tooltip: 'Load',
            onPressed: _fetch,
            icon: const Icon(Icons.cloud_download),
          ),
        ],
      ),
      body: BlocListener<RealizationCubit, RealizationState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => setState(() => _loading = true),
            failure: (msg) => setState(() {
              _loading = false;
              _error = msg;
            }),
            loaded: (list) => setState(() {
              _loading = false;
              _error = null;
              _list = list;
            }),
            orElse: () {},
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      value: _selectedYear,
                      decoration: const InputDecoration(labelText: 'Year'),
                      items: years
                          .map((y) => DropdownMenuItem(value: y, child: Text(y.toString())))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedYear = val);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      value: _selectedMonth,
                      decoration: const InputDecoration(labelText: 'Month'),
                      items: months
                          .map((m) => DropdownMenuItem(
                                value: m,
                                child: Text(DateFormat('MMM').format(DateTime(0, m))),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedMonth = val);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: _fetch,
                    icon: const Icon(Icons.search),
                    label: const Text('Fetch'),
                  ),
                ],
              ),
            ),
            if (_loading) const LinearProgressIndicator(),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_error!)),
                    IconButton(
                      onPressed: _fetch,
                      icon: const Icon(Icons.refresh),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Expanded(
              child: _list.isEmpty
                  ? Center(
                      child: Text(_loading ? '' : 'No data. Adjust filters and Fetch.'),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _SummaryChip(
                                  label: 'Obj', value: totalObj.toString(), color: Colors.blue),
                              _SummaryChip(
                                  label: context.i10n.sold,
                                  value: totalVendue.toString(),
                                  color: Colors.green),
                              _SummaryChip(
                                  label: context.i10n.orders,
                                  value: totalOrders.toString(),
                                  color: Colors.orange),
                              _SummaryChip(
                                  label: '${context.i10n.avgRealization} %',
                                  value: '${avgTxReal.toStringAsFixed(1)}%',
                                  color: Colors.purple),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: _list.length,
                            separatorBuilder: (_, __) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final r = _list[index];
                              return ListTile(
                                dense: true,
                                title: Text(
                                  r.medCommercialName.isEmpty ? (r.medAmm ?? '') : r.medCommercialName,
                                  maxLines: 2,
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  '${context.i10n.obj}: ${r.qteObj} • ${context.i10n.sold}: ${r.qteVendue} • ${context.i10n.orders}: ${r.nbrCde}',
                                  style: context.textTheme.bodyLarge,
                                ),
                                trailing: Text(
                                  '${r.txReal}%',
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _SummaryChip({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
