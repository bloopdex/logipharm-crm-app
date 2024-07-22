part of 'cnrc_update_cubit.dart';

@freezed
class CNRCUpdateState with _$CNRCUpdateState {
  const factory CNRCUpdateState.initial() = _Initial;
  const factory CNRCUpdateState.loading() = _Loading;
  const factory CNRCUpdateState.loaded() = _Loaded;
  const factory CNRCUpdateState.failure({required String message}) = _Failure;
}
