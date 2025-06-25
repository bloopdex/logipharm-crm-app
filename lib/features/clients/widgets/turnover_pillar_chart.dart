import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/turnover/turnover.dart';

class TurnoverPillarChart extends StatelessWidget {
  final List<Turnover> turnovers;

  const TurnoverPillarChart({super.key, required this.turnovers});

  @override
  Widget build(BuildContext context) {
    final bool showFakeData = turnovers.isEmpty;
    final data = showFakeData ? _generateFakeData() : turnovers;
    final maxValue = _getMaxValue(data);

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
                _buildSyncfusionChart(data, maxValue, showFakeData),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSyncfusionChart(List<Turnover> data, double maxValue, bool showFakeData) {
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
            xValueMapper: (turnover, _) => _getMonthAbbreviation(turnover.month),
            yValueMapper: (turnover, _) => turnover.turnover,
            color: color,
            borderRadius: BorderRadius.circular(4),
            width: 0.7,
          ),
        ],
      ),
    );
  }

  List<Turnover> _generateFakeData() {
    return List.generate(
        12,
        (index) => Turnover(
              year: DateTime.now().year,
              month: index + 1,
              turnover: (index + 1) * 1500.0,
            ));
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
