import 'package:crm/core/core.dart';
import 'package:crm/features/events/models/eventvisite/eventvisite.dart';
import 'package:crm/shared/widgets/inputs/custom.text.form.field.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisitDetailPage extends StatelessWidget {
  final EventVisite visit;

  const VisitDetailPage({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            size: kSpacingX7,
            color: kWhite,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.i10n.visitDetailsTitle,
          style: context.textTheme.headlineMedium!.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingMd2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kSpacingX3),
            Text(
              context.i10n.visitDate,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: DateFormat("dd MMM yyyy").format(visit.date ?? DateTime.now()),
              readOnly: true,
            ),
            SizedBox(height: kSpacingX3),
            Text(
              context.i10n.lastName,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: visit.nom ?? context.i10n.noName,
              readOnly: true,
            ),
            SizedBox(height: kSpacingX3),
            Text(
              context.i10n.firstName,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: visit.prenom ?? context.i10n.noName,
              readOnly: true,
            ),
            SizedBox(height: kSpacingX3),
            Text(
              context.i10n.address,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: visit.address ?? context.i10n.noAddress,
              readOnly: true,
            ),
            SizedBox(height: kSpacingX3),
            Text(
              context.i10n.phone,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: visit.telephone ?? context.i10n.noPhone,
              readOnly: true,
            ),
            SizedBox(height: kSpacingX3),
            Text(
              context.i10n.email,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: visit.email ?? context.i10n.noEmail,
              readOnly: true,
            ),
            SizedBox(height: kSpacingX3),
            Text(
              context.i10n.note,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: kSpacingX1),
            CustomTextFormField(
              initialValue: visit.remarque ?? context.i10n.noNote,
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
