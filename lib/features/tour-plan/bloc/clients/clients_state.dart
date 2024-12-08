part of 'clients_cubit.dart';

@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState.initial() = _Initial;
  const factory ClientsState.loading() = _Loading;
  const factory ClientsState.loaded({
    required List<Person> allClients,
    required List<Person> filteredClients,
  }) = _Loaded;
  const factory ClientsState.error(String message) = _Error;
}
