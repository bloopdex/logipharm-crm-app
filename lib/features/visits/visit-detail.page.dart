import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:crm/shared/widgets/inputs/custom.text.form.field.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisitDetailPage extends StatelessWidget {
  final TourDetail visit;
  const VisitDetailPage({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    String status(int? s) => switch (s) {
          0 => context.i10n.pending,
          1 => context.i10n.inProgress,
          2 => context.i10n.completed,
          _ => '-'
        };
    String fmt(String? s) => (s == null || s.isEmpty) ? '-' : s;
    String dateStr(String? iso) {
      if (iso == null || iso.isEmpty) return '-';
      final d = DateTime.tryParse(iso);
      if (d == null) return iso;
      return DateFormat("dd MMM yyyy HH:mm").format(d);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon:
              Icon(Icons.chevron_left_rounded, size: kSpacingX7, color: kWhite),
          onPressed: () => context.pop(),
        ),
        title: Text(
          context.i10n.visitDetailsTitle,
          style: context.textTheme.headlineMedium!.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: kPaddingMd2, vertical: kPaddingMd2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kSpacingX3),
            Text(context.i10n.client, style: context.textTheme.bodyMedium),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
                initialValue: fmt(visit.pharmacy?.fullName), readOnly: true),
            SizedBox(height: kSpacingX3),
            Text(context.i10n.visitDate, style: context.textTheme.bodyMedium),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
                initialValue: dateStr(visit.startDate), readOnly: true),
            SizedBox(height: kSpacingX3),
            Text(context.i10n.endDate, style: context.textTheme.bodyMedium),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
                initialValue: dateStr(visit.endDate), readOnly: true),
            SizedBox(height: kSpacingX3),
            Text(context.i10n.status, style: context.textTheme.bodyMedium),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
                initialValue: status(visit.statusFlag), readOnly: true),
            SizedBox(height: kSpacingX3),
            Text(context.i10n.visitCreationReasonLabel,
                style: context.textTheme.bodyMedium),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
                initialValue: fmt(visit.reason?.label), readOnly: true),
            SizedBox(height: kSpacingX3),
            Text(context.i10n.note, style: context.textTheme.bodyMedium),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: fmt(visit.reportText),
              readOnly: true,
              minLines: 4,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
