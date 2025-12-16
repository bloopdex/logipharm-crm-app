import 'dart:developer';

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
        List<Person> clients = response.data['body']
            .map<Person>((client) => Person.fromJson(client))
            .toList();

        clients.sort((a, b) =>
            a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()));
        // Initially, the filtered clients list is the same as the full clients list
        emit(
            ClientsState.loaded(allClients: clients, filteredClients: clients));
      } else {
        emit(const ClientsState.loaded(allClients: [], filteredClients: []));
      }
    } catch (e) {
      log('ClientsCubit@load Error: $e');
      emit(const ClientsState.error('An error occurred'));
    }
  }

  Future<void> filter(
      {String searchQuery = "",
      String regionId = "",
      String commune = "",
      bool? prospect}) async {
    try {
      state.maybeWhen(
        loaded: (allClients, filteredClients) {
          // Start with the full list of clients
          List<Person> filteredList = List.from(allClients);

          // Apply region filter if provided
          if (regionId.isNotEmpty) {
            filteredList = filteredList
                .where((client) => client.regionId == regionId)
                .toList();
          }

          // Apply commune filter if provided
          if (commune.isNotEmpty) {
            filteredList = filteredList.where((client) {
              final ville = client.ville?.toLowerCase() ?? '';
              final searchCommune = commune.toLowerCase();

              debugPrint('Filtering by Commune: $commune');
              debugPrint('Client Ville: $ville');

              return ville.contains(searchCommune);
            }).toList();
          }

          // Apply search query filter if provided
          if (searchQuery.isNotEmpty) {
            filteredList = filteredList.where((client) {
              final fullName = client.fullName.toLowerCase();
              final lastName = client.lastName.toLowerCase();
              final firstName = client.firstName?.toLowerCase() ?? '';
              final query = searchQuery.toLowerCase();

              debugPrint('Filtering by Search Query: $searchQuery');
              debugPrint('Client Full Name: $fullName');

              return fullName.contains(query) ||
                  lastName.contains(query) ||
                  firstName.contains(query);
            }).toList();
          }

          // Filter by client type
          if (prospect != null) {
            filteredList = filteredList
                .where((client) => client.prospect == prospect)
                .toList();
          }

          filteredList.sort((a, b) =>
              a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()));

          // Emit new state with updated filtered clients
          emit(ClientsState.loaded(
              allClients: allClients, filteredClients: filteredList));
        },
        orElse: () {},
      );
    } catch (e) {
      emit(const ClientsState.error('An error occurred during filtering'));
    }
  }

  void reset() {
    emit(const ClientsState.initial());
  }
}
