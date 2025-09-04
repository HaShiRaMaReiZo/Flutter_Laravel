import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/models/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated({required User user}) =
      AuthAuthenticated;

  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  const factory AuthState.failure({required String message}) = AuthFailure;

  const factory AuthState.success({
    required String message,
    required User user,
  }) = AuthSuccess;
}
