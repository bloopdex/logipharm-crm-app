part of 'claim_cubit.dart';

@freezed
class ClaimState with _$ClaimState {
  const factory ClaimState.initial() = _Initial;
  const factory ClaimState.loading() = _Loading;
  const factory ClaimState.loaded(List<Claim> observations) = _Loaded;
  const factory ClaimState.error(String message) = _Error;
}
