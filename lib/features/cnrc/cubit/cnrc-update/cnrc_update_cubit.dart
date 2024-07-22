import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crm/features/cnrc/services/commercial_register.repository.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cnrc_update_cubit.freezed.dart';
part 'cnrc_update_state.dart';

class CNRCUpdateCubit extends Cubit<CNRCUpdateState> {
  CNRCUpdateCubit() : super(const CNRCUpdateState.initial());

  Future<void> create(Map<String, dynamic> data) async {
    emit(const CNRCUpdateState.loading());
    try {
      final Response response = await CommercialRegisterRepository.update(data: data);
      if (response.statusCode == 200) {
        emit(const CNRCUpdateState.loaded());
        return;
      } else {
        emit(CNRCUpdateState.failure(message: response.data['message'] ?? 'An error occurred'));
        return;
      }
    } catch (e) {
      log(e.toString());
      emit(CNRCUpdateState.failure(message: e.toString()));
      return;
    }
  }

  void reset() {
    emit(const CNRCUpdateState.initial());
  }
}
