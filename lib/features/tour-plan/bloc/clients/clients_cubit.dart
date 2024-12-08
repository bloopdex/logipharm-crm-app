import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/person/person.dart';
import '../../services/client.repository.dart';

part 'clients_cubit.freezed.dart';
part 'clients_state.dart';

class ClientsCubit extends Cubit<ClientsState> {
  ClientsCubit() : super(const ClientsState.initial());

  static ClientsCubit get(context) => BlocProvider.of<ClientsCubit>(context);

  Future<void> load() async {
    emit(const ClientsState.loading());
    try {
      final Response response = await ClientRepository.get();
      if (response.statusCode == 200) {
        List<Person> clients =
            response.data['body'].map<Person>((client) => Person.fromJson(client)).toList();
        // Initially, the filtered clients list is the same as the full clients list
        emit(ClientsState.loaded(allClients: clients, filteredClients: clients));
      } else {
        emit(const ClientsState.loaded(allClients: [], filteredClients: []));
      }
    } catch (e) {
      emit(const ClientsState.error('An error occurred'));
    }
  }

  Future<void> filter({String regionId = "", String commune = ""}) async {
    try {
      state.maybeWhen(
        loaded: (allClients, filteredClients) {
          // Start with the full list of clients
          var filteredList = allClients;

          // Apply region filter if provided
          if (regionId.isNotEmpty) {
            filteredList = filteredList.where((element) => element.regionId == regionId).toList();
          }

          // Apply commune filter if provided
          if (commune.isNotEmpty) {
            filteredList = filteredList.where((element) {
              final ville = element.ville?.toLowerCase() ?? '';
              final searchCommune = commune.toLowerCase();

              debugPrint('Commune: $commune');
              debugPrint('Ville: $ville');

              return ville.contains(searchCommune);
            }).toList();
          }

          // Emit new state with updated filtered clients
          emit(ClientsState.loaded(allClients: allClients, filteredClients: filteredList));
        },
        orElse: () {},
      );
    } catch (e) {
      emit(const ClientsState.error('An error occurred'));
    }
  }

  void reset() {
    emit(const ClientsState.initial());
  }
}
