import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/person/person.dart';
import '../../services/client.repository.dart';

part 'clients_state.dart';
part 'clients_cubit.freezed.dart';

class ClientsCubit extends Cubit<ClientsState> {
  ClientsCubit() : super(const ClientsState.initial());

  static ClientsCubit get(context) => BlocProvider.of<ClientsCubit>(context);

  Future<void> load() async {
    emit(const ClientsState.loading());
    try {
      final Response response = await ClientRepository.get();
      if (response.statusCode == 200) {
        List<Person> clients = response.data['body']
            .map<Person>((client) => Person.fromJson(client))
            .toList();
        emit(ClientsState.loaded(clients));
      } else {
        emit(const ClientsState.loaded([]));
      }
    } catch (e) {
      emit(const ClientsState.error('An error occurred'));
    }
  }

  Future<void> filter(String regionId) async {
    if (state.maybeWhen(
      orElse: () => false,
      loaded: (clients) => clients.isEmpty,
    )) {
      emit(const ClientsState.loading());
      final Response response = await ClientRepository.get();
      if (response.statusCode == 200) {
        List<Person> clients = response.data['body']
            .map<Person>((client) => Person.fromJson(client))
            .toList();
        emit(ClientsState.loaded(
            clients.where((element) => element.regionId == regionId).toList()));
      } else {
        emit(const ClientsState.loaded([]));
      }
    }
    if (regionId.isEmpty) {
      emit(const ClientsState.loaded([]));
    } else {
      List<Person> filteredClients = state.maybeWhen(
          orElse: () => [],
          loaded: (state) =>
              state.where((element) => element.regionId == regionId).toList());
      emit(ClientsState.loaded(filteredClients));
    }
  }
}
