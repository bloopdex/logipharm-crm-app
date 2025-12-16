part of 'offers_cubit.dart';

@Freezed()
class OffersState with _$OffersState {
  const factory OffersState.initial() = _Initial;
  const factory OffersState.loading() = _Loading;
  const factory OffersState.loaded(List<OfferDto> offers) = _Loaded;
  const factory OffersState.empty() = _Empty;
  const factory OffersState.error(String message) = _Error;
}
