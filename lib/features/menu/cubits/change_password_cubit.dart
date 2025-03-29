import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/services/auth.repository.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState.initial());

  Future<void> changePassword(Map<String, String> data) async {
    try {
      emit(const ChangePasswordState.loading());
      Response res = await AuthRepository.update(data);
      if (res.statusCode != 200) {
        emit(const ChangePasswordState.error('auth:change-password-failed'));
        return;
      }

      emit(const ChangePasswordState.success());
    } catch (e) {
      emit(const ChangePasswordState.error('auth:change-password-failed'));
    }
  }
}
