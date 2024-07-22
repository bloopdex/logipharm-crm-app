import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/services/auth.repository.dart';
import '../../models/user/user.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<_AppStarted>(_onAppStarted);
    on<_LoggedIn>(_onLoggedIn);
    on<_LoggedOut>(_onLoggedOut);
    on<_UpdateUser>(_onUpdateUser);
    on<_ChangePassword>(_changePassword);
  }

  FutureOr<void> _onAppStarted(_AppStarted event, Emitter<AuthState> emit) async {
    try {
      emit(const _Loading());

      final token = await AuthRepository.token;
      if (token != null) {
        final emitEvent = await setuser(token);
        emit(emitEvent);
      } else {
        emit(const _Unauthenticated());
        return;
      }
    } catch (e) {
      log("Auth Error $e");
      emit(const _Failure('Auth Errors:something-went-wrong'));
    }
  }

  FutureOr<void> _onLoggedIn(_LoggedIn event, Emitter<AuthState> emit) async {
    try {
      emit(const _Loading());

      await AuthRepository.setToken(event.token);
      final emitEvent = await setuser("Bearer ${event.token}");
      emit(emitEvent);
    } catch (e) {
      log("Auth Error $e");
      emit(const _Unauthenticated());
    }
  }

  FutureOr<void> _onLoggedOut(_LoggedOut event, Emitter<AuthState> emit) async {
    try {
      emit(const _Loading());
      await AuthRepository.deleteToken();
      emit(const _Unauthenticated());
    } catch (e) {
      log("Auth Error $e");
      emit(const _Unauthenticated());
    }
  }

  FutureOr<void> _onUpdateUser(_UpdateUser event, Emitter<AuthState> emit) async {
    try {
      final emitEvent = await setuser(event.token);
      emit(emitEvent);
      return;
    } catch (e) {
      log("Auth Error $e");
      emit(const _Unauthenticated());
    }
  }

  FutureOr<void> _changePassword(_ChangePassword event, Emitter<AuthState> emit) async {
    try {
      emit(const _Loading());
      final Map<String, String> data = {
        "oldPassword": event.oldPassword,
        "newPassword": event.newPassword,
        "newPasswordConfirmation": event.newPassword
      };
      Response response = await AuthRepository.update(data);
      if (response.statusCode != 200) {
        emit(_Authenticated(user, "auth:wrong-password"));
      }
      emit(_Authenticated(user, null));
    } catch (e) {
      log("Auth Error $e");
      emit(const _Unauthenticated());
    }
  }

  Future<AuthState> setuser(String token) async {
    try {
      Response res = await AuthRepository.getUser(token);
      if (res.statusCode != 200) {
        await AuthRepository.deleteToken();
        return const _Unauthenticated();
      }
      _user = User.fromJson(res.data['body']);
      AuthRepository.setCompany(_user.id.companyId);
      return _Authenticated(_user, null);
    } catch (e) {
      log("Auth Auth Error $e");
      return const _Failure('Auth Errors:something-went-wrong');
    }
  }

  User _user = const User(
    id: Id(id: 0, companyId: 0, typeTier: ''),
    lastName: '',
    firstName: null,
    loginCode: '',
    actionFlag: 0,
    regionId: '',
    address: null,
    latitude: null,
    longitude: null,
    supervisor: null,
    addVisitOutPlanPrivilege: 0,
    fullName: '',
  );

  User get user => _user;
}
