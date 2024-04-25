import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:flutter/material.dart';

class VisitDetailPage extends StatelessWidget {
  final TourDetail visit;
  const VisitDetailPage({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.visitDetailsTitle),
      ),
      body: const Center(
        child: Text('Visit Detail'),
      ),
    );
  }
}
