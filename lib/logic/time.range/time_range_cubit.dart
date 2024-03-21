import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_range_state.dart';
part 'time_range_cubit.freezed.dart';

enum SelectedDate { start, end }

class TimeRangeCubit extends Cubit<TimeRangeState> {
  TimeRangeCubit()
      : super(TimeRangeState.initial(
          startDate: DateTime(DateTime.now().year, 1, 1),
          endDate: DateTime(DateTime.now().year, 12, 31),
          validatedStartDate: null,
          validatedEndDate: null,
        ));

  void validate(DateTime start, DateTime end) {
    emit(
      TimeRangeState.initial(
        startDate: state.startDate,
        endDate: state.endDate,
        validatedStartDate: start,
        validatedEndDate: end,
      ),
    );
  }

  void reset() {
    emit(TimeRangeState.initial(
      startDate: DateTime(DateTime.now().year, 1, 1),
      endDate: DateTime(DateTime.now().year, 12, 31),
      validatedStartDate: null,
      validatedEndDate: null,
    ));
  }

  static TimeRangeCubit get(context) => BlocProvider.of(context);
}
