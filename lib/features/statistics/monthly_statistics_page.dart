import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'cubit/monthly_statistics_cubit.dart';
import 'models/monthly_statistics.dart';

class MonthlyStatisticsPage extends StatefulWidget {
  static const String routeName = '/monthly-statistics';

  const MonthlyStatisticsPage({super.key});

  @override
  State<MonthlyStatisticsPage> createState() => _MonthlyStatisticsPageState();
}

class _MonthlyStatisticsPageState extends State<MonthlyStatisticsPage> {
  DateTime? _periodStart;
  DateTime? _periodEnd;

  @override
  void initState() {
    super.initState();
    context.read<MonthlyStatisticsCubit>().loadStatistics();
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _periodStart != null && _periodEnd != null
          ? DateTimeRange(start: _periodStart!, end: _periodEnd!)
          : null,
    );

    if (picked != null) {
      setState(() {
        _periodStart = picked.start;
        _periodEnd = picked.end;
      });
      context.read<MonthlyStatisticsCubit>().loadStatistics(
            periodStart: _periodStart,
            periodEnd: _periodEnd,
          );
    }
  }

  void _resetDateRange() {
    setState(() {
      _periodStart = null;
      _periodEnd = null;
    });
    context.read<MonthlyStatisticsCubit>().loadStatistics();
  }

  Color _getPercentageColor(double percentage) {
    if (percentage >= 75) return kSuccessColor;
    if (percentage >= 50) return kBrightSun;
    return kCardinal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réalisations Mensuelles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _selectDateRange,
          ),
          if (_periodStart != null || _periodEnd != null)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _resetDateRange,
            ),
        ],
      ),
      body: BlocBuilder<MonthlyStatisticsCubit, MonthlyStatisticsState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text('Sélectionnez une période')),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: kCardinal),
                  SizedBox(height: kSpacingX3),
                  Text('Erreur', style: context.textTheme.headlineMedium),
                  SizedBox(height: kSpacingX2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                    child: Text(message, textAlign: TextAlign.center),
                  ),
                  SizedBox(height: kSpacingX4),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<MonthlyStatisticsCubit>().loadStatistics(
                              periodStart: _periodStart,
                              periodEnd: _periodEnd,
                            ),
                    child: Text('Réessayer'),
                  ),
                ],
              ),
            ),
            loaded: (statistics) => RefreshIndicator(
              onRefresh: () =>
                  context.read<MonthlyStatisticsCubit>().loadStatistics(
                        periodStart: _periodStart,
                        periodEnd: _periodEnd,
                      ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(kPaddingMd2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPeriodCard(statistics),
                    SizedBox(height: kSpacingX3),
                    _buildOrdersCard(statistics.orders),
                    SizedBox(height: kSpacingX3),
                    _buildArticlesCard(statistics.articles),
                    SizedBox(height: kSpacingX3),
                    _buildProspectsCard(statistics.prospects),
                    SizedBox(height: kSpacingX3),
                    _buildObjectivesCard(statistics.objectives),
                    SizedBox(height: kSpacingX5),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPeriodCard(MonthlyStatistics statistics) {
    final formatter = DateFormat('dd/MM/yyyy');
    return Card(
      child: Padding(
        padding: EdgeInsets.all(kPaddingMd2),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: kPrimaryColor),
            SizedBox(width: kSpacingX2),
            Expanded(
              child: Text(
                'Du ${formatter.format(statistics.periodStart)} au ${formatter.format(statistics.periodEnd)}',
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersCard(OrderStats orders) {
    final percentage =
        double.tryParse(orders.percentage.replaceAll('%', '')) ?? 0;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(kPaddingMd2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(kPaddingSm3),
                  decoration: BoxDecoration(
                    color: kCeruleanBlue.shade100,
                    borderRadius: BorderRadius.circular(kSpacingX3),
                  ),
                  child: Icon(Icons.shopping_cart, color: kCeruleanBlue),
                ),
                SizedBox(width: kSpacingX2),
                Text('COMMANDES',
                    style: context.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: kSpacingX3),
            Text('${orders.validatedOrders} / ${orders.totalOrders} validées',
                style: context.textTheme.headlineMedium),
            SizedBox(height: kSpacingX2),
            LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: kBorder3,
              valueColor: AlwaysStoppedAnimation<Color>(
                  _getPercentageColor(percentage)),
            ),
            SizedBox(height: kSpacingX1),
            Text(orders.percentage,
                style: context.textTheme.titleMedium!.copyWith(
                    color: _getPercentageColor(percentage),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildArticlesCard(List<ArticleStats> articles) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(kPaddingMd2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(kPaddingSm3),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(kSpacingX3),
                  ),
                  child: Icon(Icons.medication, color: kPrimaryColor),
                ),
                SizedBox(width: kSpacingX2),
                Text('ARTICLES',
                    style: context.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: kSpacingX3),
            if (articles.isEmpty)
              Text('Aucun article',
                  style: context.textTheme.bodyMedium!.copyWith(color: kText4))
            else
              ...articles.map((article) => _buildArticleItem(article)),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleItem(ArticleStats article) {
    final percentage =
        double.tryParse(article.percentage.replaceAll('%', '')) ?? 0;
    final color = percentage >= 100
        ? kSuccessColor
        : (percentage >= 75 ? kBrightSun : kCardinal);

    return Padding(
      padding: EdgeInsets.only(bottom: kSpacingX3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(article.articleName,
                      style: context.textTheme.titleMedium)),
              Text(article.articleCode,
                  style: context.textTheme.bodySmall!.copyWith(color: kText4)),
            ],
          ),
          SizedBox(height: kSpacingX1),
          Text('${article.achieved} / ${article.objective}',
              style: context.textTheme.bodyLarge),
          SizedBox(height: kSpacingX1),
          LinearProgressIndicator(
            value: percentage > 100 ? 1.0 : percentage / 100,
            minHeight: 6,
            backgroundColor: kBorder3,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
          SizedBox(height: kSpacingX1),
          Text(article.percentage,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildProspectsCard(ProspectStats prospects) {
    final percentage =
        double.tryParse(prospects.percentage.replaceAll('%', '')) ?? 0;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(kPaddingMd2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(kPaddingSm3),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(kSpacingX3),
                  ),
                  child: Icon(Icons.person_add, color: Colors.orange),
                ),
                SizedBox(width: kSpacingX2),
                Text('PROSPECTS',
                    style: context.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: kSpacingX3),
            Text(
                '${prospects.validatedProspects} / ${prospects.totalProspects} validés',
                style: context.textTheme.headlineMedium),
            SizedBox(height: kSpacingX2),
            LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: kBorder3,
              valueColor: AlwaysStoppedAnimation<Color>(
                  _getPercentageColor(percentage)),
            ),
            SizedBox(height: kSpacingX1),
            Text(prospects.percentage,
                style: context.textTheme.titleMedium!.copyWith(
                    color: _getPercentageColor(percentage),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildObjectivesCard(ObjectiveStats objectives) {
    final caPercentage =
        double.tryParse(objectives.caPercentage.replaceAll('%', '')) ?? 0;
    final recPercentage =
        double.tryParse(objectives.recPercentage.replaceAll('%', '')) ?? 0;
    final caColor = caPercentage >= 100
        ? kSuccessColor
        : (caPercentage >= 75 ? kBrightSun : kCardinal);
    final recColor = recPercentage >= 100
        ? kSuccessColor
        : (recPercentage >= 75 ? kBrightSun : kCardinal);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(kPaddingMd2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(kPaddingSm3),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(kSpacingX3),
                  ),
                  child: Icon(Icons.flag, color: Colors.purple),
                ),
                SizedBox(width: kSpacingX2),
                Text('OBJECTIFS',
                    style: context.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: kSpacingX3),
            Text('Chiffre d\'Affaires',
                style: context.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: kSpacingX1),
            Text(
                '${_formatCurrency(objectives.caAchieved)} / ${_formatCurrency(objectives.caObjective)} DA',
                style: context.textTheme.bodyLarge),
            SizedBox(height: kSpacingX1),
            LinearProgressIndicator(
              value: caPercentage > 100 ? 1.0 : caPercentage / 100,
              minHeight: 6,
              backgroundColor: kBorder3,
              valueColor: AlwaysStoppedAnimation<Color>(caColor),
            ),
            SizedBox(height: kSpacingX1),
            Text(objectives.caPercentage,
                style: context.textTheme.bodyMedium!
                    .copyWith(color: caColor, fontWeight: FontWeight.bold)),
            SizedBox(height: kSpacingX3),
            Text('Recrutement',
                style: context.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: kSpacingX1),
            Text(
                '${objectives.recAchieved.toStringAsFixed(0)} / ${objectives.recObjective.toStringAsFixed(0)}',
                style: context.textTheme.bodyLarge),
            SizedBox(height: kSpacingX1),
            LinearProgressIndicator(
              value: recPercentage > 100 ? 1.0 : recPercentage / 100,
              minHeight: 6,
              backgroundColor: kBorder3,
              valueColor: AlwaysStoppedAnimation<Color>(recColor),
            ),
            SizedBox(height: kSpacingX1),
            Text(objectives.recPercentage,
                style: context.textTheme.bodyMedium!
                    .copyWith(color: recColor, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  String _formatCurrency(double amount) {
    final formatter = NumberFormat('#,##0.00', 'fr_FR');
    return formatter.format(amount);
  }
}
