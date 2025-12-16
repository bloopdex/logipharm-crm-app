import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/turnover/turnover.dart';

class TurnoverPillarChart extends StatelessWidget {
  final List<Turnover> turnovers;

  const TurnoverPillarChart({super.key, required this.turnovers});

  @override
  Widget build(BuildContext context) {
    final List<Turnover> normalized =
        turnovers.isEmpty ? [] : _normalizeMonths(turnovers);
    final maxValue = _getMaxValue(normalized);

    return SingleChildScrollView(
      child: SizedBox(
        height: 450,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Mensuel',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Chiffre d\'affaires par mois',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSyncfusionChart(normalized, maxValue, false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSyncfusionChart(
      List<Turnover> data, double maxValue, bool showFakeData) {
    final color = showFakeData ? Colors.blue.withOpacity(0.3) : Colors.green;

    return Expanded(
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.green.shade700,
          ),
          title: AxisTitle(
            text: '',
          ),
          labelPlacement: LabelPlacement.onTicks,
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
          maximum: maxValue,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          // Changed from ChartSeries to CartesianSeries
          BarSeries<Turnover, String>(
            dataSource: data,
            xValueMapper: (turnover, _) =>
                _getMonthAbbreviation(turnover.month),
            yValueMapper: (turnover, _) => turnover.turnover,
            color: color,
            borderRadius: BorderRadius.circular(4),
            width: 0.7,
          ),
        ],
      ),
    );
  }

  // Ensure months are always shown Jan..Dec in order, filling missing months with 0
  List<Turnover> _normalizeMonths(List<Turnover> input) {
    final Map<int, num> byMonth = {for (var i = 1; i <= 12; i++) i: 0};
    for (final t in input) {
      final m = t.month.toInt().clamp(1, 12);
      // If multiple entries for a month, sum them
      byMonth[m] = (byMonth[m] ?? 0) + (t.turnover);
    }
    final currentYear =
        input.isNotEmpty ? input.first.year : DateTime.now().year;
    final List<Turnover> out = [
      for (var m = 1; m <= 12; m++)
        Turnover(year: currentYear, month: m, turnover: byMonth[m] ?? 0)
    ];
    return out;
  }

  double _getMaxValue(List<Turnover> data) {
    final values = data.map((t) => t.turnover).toList();
    if (values.isEmpty) return 1.0;
    final maxVal = values.reduce((a, b) => a > b ? a : b);
    return maxVal > 0 ? maxVal.toDouble() : 1.0;
  }

  String _getMonthAbbreviation(num month) {
    return [
      'Jan',
      'Fév',
      'Mar',
      'Avr',
      'Mai',
      'Jun',
      'Jul',
      'Aoû',
      'Sep',
      'Oct',
      'Nov',
      'Déc'
    ][month.toInt() - 1];
  }
}
