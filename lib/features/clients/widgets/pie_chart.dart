import 'package:crm/core/extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/statistics/client_statistics.dart';

class PieChartSample3 extends StatefulWidget {
  final List<ClientReclamation> reclamations;

  const PieChartSample3({super.key, required this.reclamations});

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State<PieChartSample3> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.width,
        maxHeight: 200.h,
      ),
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.reclamations.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: AppColors.sectionColors[i % AppColors.sectionColors.length],
        value: widget.reclamations[i].number.toDouble(),
        title: '${widget.reclamations[i].status}\n${widget.reclamations[i].number}',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }
}

class AppColors {
  static const contentColorBlue = Color(0xFF4A90E2);
  static const contentColorYellow = Color(0xFFF5A623);
  static const contentColorPurple = Color(0xFF9013FE);
  static const contentColorGreen = Color(0xFF7ED321);
  static const contentColorBlack = Color(0xFF000000);

  static const sectionColors = [
    contentColorBlue,
    contentColorYellow,
    contentColorPurple,
    contentColorGreen,
  ];
}
