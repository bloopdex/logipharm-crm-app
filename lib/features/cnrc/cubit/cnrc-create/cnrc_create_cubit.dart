import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crm/features/cnrc/services/commercial_register.repository.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cnrc_create_cubit.freezed.dart';
part 'cnrc_create_state.dart';

class CNRCCreateCubit extends Cubit<CNRCCreateState> {
  CNRCCreateCubit() : super(const CNRCCreateState.initial());

  Future<void> create(Map<String, dynamic> data) async {
    emit(const CNRCCreateState.loading());
    try {
      final Response response =
          await CommercialRegisterRepository.create(data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        emit(const CNRCCreateState.success());
        return;
      } else {
        emit(CNRCCreateState.failure(
          message: response.data['message'] ?? 'An error occurred',
        ));
        return;
      }
    } catch (e) {
      log(e.toString());
      emit(CNRCCreateState.failure(message: e.toString()));
      return;
    }
  }

  void reset() {
    emit(const CNRCCreateState.initial());
  }
}
