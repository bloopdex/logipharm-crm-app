part of 'etablissement_cubit.dart';

@freezed
class EtablissementState with _$EtablissementState {
  const factory EtablissementState.initial() = _Initial;
  const factory EtablissementState.loading() = _Loading;
  const factory EtablissementState.loaded(List<Observation> etablissements) = _Loaded;
  const factory EtablissementState.error(String message) = _Error;
}
