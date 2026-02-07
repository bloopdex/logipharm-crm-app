part of 'cnrc_create_cubit.dart';

@freezed
class CNRCCreateState with _$CNRCCreateState {
  const factory CNRCCreateState.initial() = _Initial;
  const factory CNRCCreateState.loading() = _Loading;
  const factory CNRCCreateState.success() = _Success;
  const factory CNRCCreateState.failure({required String message}) = _Failure;
}
