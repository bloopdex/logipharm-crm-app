import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/person/person.dart';
import '../../../shared/widgets/inputs/date.picker.input.dart';
import '../../../shared/widgets/inputs/dropdown.input.dart';
import '../bloc/delegate_cubit.dart';

class DelegateSelectionForm extends StatelessWidget {
  final Map<String, dynamic> data;
  const DelegateSelectionForm({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.i10n.tourCreationTourDetailsTitle,
            style: context.textTheme.displayMedium,
          ),
          SizedBox(height: kSpacingX3),
          Text(
            context.i10n.tourCreationTourDetailsDescription,
            style: context.textTheme.bodyLarge,
          ),
          SizedBox(height: kSpacingX7),
          Text(
            context.i10n.tourCreationTourDetailsDelegateLabel,
            style: context.textTheme.bodyMedium,
          ),
          SizedBox(height: kSpacingX1),
          BlocBuilder<DelegateCubit, List<Person>>(
            builder: (context, state) {
              return CustomDropDownInput(
                  data: data,
                  mapKey: 'delegueId',
                  items: state
                      .map((e) => CustomDropDownItem(
                          label: e.fullName, value: e.id.toString()))
                      .toList());
            },
          ),
          SizedBox(height: kSpacingX5),
          Text(
            context.i10n.tourCreationTourDetailsDelegateLabel,
            style: context.textTheme.bodyMedium,
          ),
          SizedBox(height: kSpacingX1),
          CustomDatePicker(
            data: data,
            mapKey: 'dateDebut',
          ),
        ],
      ),
    );
  }
}
