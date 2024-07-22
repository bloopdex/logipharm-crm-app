import 'package:dio/dio.dart';
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
        emit(ClientsState.loaded(clients));
      } else {
        emit(const ClientsState.loaded([]));
      }
    } catch (e) {
      emit(const ClientsState.error('An error occurred'));
    }
  }

  Future<void> filter({String regionId = "", String commune = ""}) async {
    try {
      if (state.maybeWhen(
        orElse: () => false,
        loaded: (clients) => clients.isEmpty,
      )) {
        emit(const ClientsState.loading());
        final Response response = await ClientRepository.get();
        if (response.statusCode == 200) {
          List<Person> clients =
              response.data['body'].map<Person>((client) => Person.fromJson(client)).toList();
          emit(
            ClientsState.loaded(
              clients.where((element) => element.regionId == regionId || regionId.isEmpty).toList(),
            ),
          );
          return;
        } else {
          emit(const ClientsState.loaded([]));
        }
      }
      if (regionId.isNotEmpty || commune.isNotEmpty) {
        emit(
          state.maybeWhen(
            orElse: () => const ClientsState.loaded([]),
            loaded: (clients) => ClientsState.loaded(
              clients.where((element) {
                if (commune.isNotEmpty) {
                  return element.regionId == regionId && element.ville == commune;
                } else {
                  return element.regionId == regionId;
                }
              }).toList(),
            ),
          ),
        );
      }
    } catch (e) {
      emit(const ClientsState.error('An error occurred'));
    }
  }

  void reset() {
    emit(const ClientsState.initial());
  }
}
