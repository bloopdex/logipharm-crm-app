part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appstarted() = _AppStarted;
  const factory AuthEvent.loggedIn({required String token}) = _LoggedIn;
  const factory AuthEvent.loggedOut() = _LoggedOut;
  const factory AuthEvent.updateuser(String token) = _UpdateUser;
  const factory AuthEvent.changepassword(
      {required String oldPassword,
      required String newPassword}) = _ChangePassword;
}
