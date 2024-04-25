part of 'time_range_cubit.dart';

@freezed
class TimeRangeState with _$TimeRangeState {
  const factory TimeRangeState.initial({
    required DateTime startDate,
    required DateTime endDate,
    DateTime? validatedStartDate,
    DateTime? validatedEndDate,
  }) = _Initial;
}
