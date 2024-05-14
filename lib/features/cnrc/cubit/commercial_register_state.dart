part of 'commercial_register_cubit.dart';

@freezed
class CommercialRegisterState with _$CommercialRegisterState {
  const factory CommercialRegisterState.initial() = _Initial;
  const factory CommercialRegisterState.loading() = _Loading;
  const factory CommercialRegisterState.loaded({
    required List<CommercialRegister> commercialRegisters,
    required int page,
    required bool hasReachedMax,
  }) = _Loaded;
  const factory CommercialRegisterState.error({required String message}) = _Error;
}
