import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crm/features/cnrc/models/commercial_register.dart';
import 'package:crm/features/cnrc/services/commercial_register.repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'commercial_register_cubit.freezed.dart';
part 'commercial_register_state.dart';

class CommercialRegisterCubit extends Cubit<CommercialRegisterState> {
  static const int _perPage = 20;
  CommercialRegisterCubit() : super(const CommercialRegisterState.initial());
  String? _currentQuery;

  Future<void> started() async {
    try {
      emit(const CommercialRegisterState.loading());
      _currentQuery = null;

      final response = await CommercialRegisterRepository.get(
        page: 1,
        size: _perPage,
        query: _currentQuery,
      );

      final List<CommercialRegister> commercialRegisters = response.data['body']
              ['content']
          .map<CommercialRegister>((e) => CommercialRegister.fromJson(e))
          .toList();

      emit(CommercialRegisterState.loaded(
        commercialRegisters: commercialRegisters,
        page: 1,
        hasReachedMax: response.data['body']['last'],
      ));
    } catch (e) {
      log("Commercial Register Cubit: $e");
      emit(CommercialRegisterState.error(message: e.toString()));
    }
  }

  Future<void> loadMore() async {
    if (state is _Loaded && !(state as _Loaded).hasReachedMax) {
      final currentState = state as _Loaded;
      final int nextPage = currentState.page + 1;

      try {
        final response = await CommercialRegisterRepository.get(
          page: nextPage,
          size: _perPage,
          query: _currentQuery,
        );

        final List<CommercialRegister> commercialRegisters = response
            .data['body']['content']
            .map<CommercialRegister>((e) => CommercialRegister.fromJson(e))
            .toList();

        emit(CommercialRegisterState.loaded(
          commercialRegisters:
              currentState.commercialRegisters + commercialRegisters,
          page: nextPage,
          hasReachedMax: response.data['body']['last'],
        ));
      } catch (e) {
        log("Commercial Register Cubit: $e");

        emit(CommercialRegisterState.error(message: e.toString()));
      }
    }
  }

  Future<void> search({String? query}) async {
    try {
      emit(const CommercialRegisterState.loading());
      final normalizedQuery =
          (query?.trim().isEmpty ?? true) ? null : query?.trim();
      _currentQuery = normalizedQuery;

      log("Searching Commercial Register with query: $_currentQuery");
      final response = await CommercialRegisterRepository.get(
        query: _currentQuery,
        page: 1,
        size: _perPage,
      );

      final List<CommercialRegister> commercialRegisters = response.data['body']
              ['content']
          .map<CommercialRegister>((e) => CommercialRegister.fromJson(e))
          .toList();

      emit(CommercialRegisterState.loaded(
        commercialRegisters: commercialRegisters,
        page: 1,
        hasReachedMax: response.data['body']['last'],
      ));
    } catch (e) {
      log("Commercial Register Cubit: $e");
      emit(CommercialRegisterState.error(message: e.toString()));
    }
  }

  void reset() {
    emit(const CommercialRegisterState.initial());
  }
}
