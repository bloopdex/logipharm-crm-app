part of 'client_details_cubit.dart';

@freezed
class ClientDetailsState with _$ClientDetailsState {
  const factory ClientDetailsState.initial() = _Initial;
  const factory ClientDetailsState.loading() = _Loading;
  const factory ClientDetailsState.loaded({
    required ClientStatistics statistics,
  }) = _Loaded;
  const factory ClientDetailsState.failure({
    required String message,
  }) = _Failure;
}
