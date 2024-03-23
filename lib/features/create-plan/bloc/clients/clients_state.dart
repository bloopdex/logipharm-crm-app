part of 'clients_cubit.dart';

@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState.initial() = _Initial;
  const factory ClientsState.loading() = _Loading;
  const factory ClientsState.loaded(List<Person> clients) = _Loaded;
  const factory ClientsState.error(String message) = _Error;
}
