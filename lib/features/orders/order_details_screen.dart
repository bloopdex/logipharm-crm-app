import 'package:crm/core/core.dart';
import 'package:crm/features/orders/blocs/order_details/order_details_cubit.dart';
import 'package:crm/features/orders/models/order/order.dart';
import 'package:crm/shared/utils/money.formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'models/order/order_detail.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderDetailsCubit>().load(widget.order.id);
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order.reference}'),
      ),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => Center(child: Text(message)),
            loaded: (details) => Column(
              children: [
                _Header(order: order),
                const Divider(height: 1),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(kPaddingMd1),
                    itemCount: details.length,
                    separatorBuilder: (_, __) => SizedBox(height: kPaddingSm3),
                    itemBuilder: (context, index) {
                      final d = details[index];
                      return _DetailRow(d: d);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ----------------------------------------------------------
   HEADER – clean, modern, responsive
   ---------------------------------------------------------- */
class _Header extends StatelessWidget {
  final Order order;
  const _Header({required this.order});

  Color _statusColor(BuildContext context) {
    final map = {
      'LIVREE': Colors.green,
      'ANNULÉE': Colors.red,
      'EN COURS': Colors.orange,
      'EN PRÉPARATION': Colors.blue,
    };
    return map[order.statut.toUpperCase()] ?? Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order.client,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order.statut,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${context.i10n.labelReference} : ${order.reference}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '${context.i10n.expirationDate} : ${DateFormat('dd/MM/yyyy').format(order.date)}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Spacer(),
              Text(
                MoneyHelper.format(context, order.totalTtc),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* ----------------------------------------------------------
   DETAIL ROW – modern list item
   ---------------------------------------------------------- */
class _DetailRow extends StatelessWidget {
  final OrderDetail d;
  const _DetailRow({required this.d});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    d.medCommercialName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Lot: ${d.lot}  •  Exp: '
                    '${DateFormat('MM/yyyy').format(d.datePeremption)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${d.qte}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  MoneyHelper.format(context, d.montTtc),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
