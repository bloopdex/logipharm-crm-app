part of 'file_cubit.dart';

@freezed
class FileState with _$FileState {
  const factory FileState.initial() = _Initial;
  const factory FileState.loading() = _Loading;
  const factory FileState.loaded(Map<String, FileModel> files) = _Loaded;
  const factory FileState.error(Map<String, String> error) = _Error;
}
