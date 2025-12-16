part of 'paliers_cubit.dart';

@Freezed()
class OfferPaliersState with _$OfferPaliersState {
  const factory OfferPaliersState.initial() = _Initial;
  const factory OfferPaliersState.loading() = _Loading;
  const factory OfferPaliersState.loaded(List<PalierDto> paliers) = _Loaded;
  const factory OfferPaliersState.empty() = _Empty;
  const factory OfferPaliersState.error(String message) = _Error;
}
