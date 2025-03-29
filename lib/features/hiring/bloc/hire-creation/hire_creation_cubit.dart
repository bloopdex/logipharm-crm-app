import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../logic/file/file_cubit.dart';
import '../../models/hire.dart';
import '../../services/hire.repository.dart';

part 'hire_creation_cubit.freezed.dart';
part 'hire_creation_state.dart';

class HireCreationCubit extends Cubit<HireCreationState> {
  HireCreationCubit() : super(const HireCreationState.initial());

  Future<void> create(Map<String, dynamic> data) async {
    emit(const HireCreationState.loading());
    try {
      final Response response = await HireRepository.create(data: data);
      if (response.statusCode == 200) {
        Hire hire = Hire.fromJson(response.data['body']);
        emit(HireCreationState.loaded(hire: hire));
        return;
      } else {
        emit(HireCreationState.failure(message: response.data['message'] ?? 'An error occurred'));
        return;
      }
    } catch (e) {
      log(e.toString());
      emit(HireCreationState.failure(message: e.toString()));
      return;
    }
  }

  Future<void> file(String hireId, FileModel file) async {
    emit(const HireCreationState.loading());
    try {
      await HireRepository.file(
        hireId: hireId,
        file: file,
      );
      emit(const HireCreationState.initial());
    } catch (e) {
      log(e.toString());
      emit(HireCreationState.failure(message: e.toString()));
      return;
    }
  }

  void reset() {
    emit(const HireCreationState.initial());
  }
}
