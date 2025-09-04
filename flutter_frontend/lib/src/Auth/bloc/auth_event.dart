import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = AuthLoginRequested;

  const factory AuthEvent.registerRequested({
    required String name,
    required String email,
    required String password,
  }) = AuthRegisterRequested;

  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;

  const factory AuthEvent.statusChecked() = AuthStatusChecked;

  const factory AuthEvent.userRequested() = AuthUserRequested;
}
