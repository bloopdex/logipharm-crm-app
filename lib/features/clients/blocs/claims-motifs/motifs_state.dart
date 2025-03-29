part of 'motifs_cubit.dart';

@freezed
class ClaimMotifState with _$ClaimMotifState {
  const factory ClaimMotifState.initial() = _Initial;
  const factory ClaimMotifState.loading() = _Loading;
  const factory ClaimMotifState.loaded(List<ClaimMotif> observations) = _Loaded;
  const factory ClaimMotifState.error(String message) = _Error;
}
