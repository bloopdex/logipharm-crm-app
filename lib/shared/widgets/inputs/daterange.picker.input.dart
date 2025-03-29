// ignore_for_file: use_build_context_synchronously

import 'package:crm/core/const.dart';
import 'package:crm/logic/time.range/time_range_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extension.dart';

class CustomDateRangePicker extends StatelessWidget {
  const CustomDateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeRangeCubit, TimeRangeState>(
      builder: (context, state) {
        return ElevatedButton(
          style: context.elevatedButtonTheme.copyWith(
            backgroundColor: MaterialStatePropertyAll(kBgGrayVisibility1),
          ),
          onPressed: () async {
            final DateTimeRange? picked = await showDateRangePicker(
              context: context,
              currentDate: DateTime.now(),
              // Allow dates from 1900 to 2100
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              helpText: context.i10n.selectDateRange,
              saveText: context.i10n.save,
              confirmText: context.i10n.confirm,
              cancelText: context.i10n.cancel,
              initialEntryMode: DatePickerEntryMode.calendar,
              fieldStartHintText: context.i10n.startDate,
              fieldEndHintText: context.i10n.endDate,
              fieldStartLabelText: context.i10n.startDate,
              fieldEndLabelText: context.i10n.endDate,
              switchToInputEntryModeIcon: const Icon(Icons.edit_outlined),
              switchToCalendarEntryModeIcon: const Icon(Icons.calendar_today_outlined),
              keyboardType: TextInputType.datetime,
              initialDateRange: DateTimeRange(
                start: state.validatedStartDate ?? DateTime.now(),
                end: state.validatedEndDate ?? DateTime.now(),
              ),
              builder: (context, child) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: context.height * 0.8,
                    width: context.width * 0.9,
                    child: child,
                  ),
                );
              },
            );
            if (picked != null) {
              context.read<TimeRangeCubit>().validate(picked.start, picked.end);
            }
          },
          child: Icon(
            Icons.calendar_month,
            color: kBgBlack,
          ),
        );
      },
    );
  }
}
