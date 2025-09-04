import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthState.initial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthStatusChecked>(_onAuthStatusChecked);
    on<AuthUserRequested>(_onUserRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final authResponse = await _authRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(
        AuthState.success(message: 'Login successful', user: authResponse.user),
      );
      emit(AuthState.authenticated(user: authResponse.user));
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final authResponse = await _authRepository.register(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(
        AuthState.success(
          message: 'Registration successful',
          user: authResponse.user,
        ),
      );
      emit(AuthState.authenticated(user: authResponse.user));
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await _authRepository.logout();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }

  Future<void> _onAuthStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final isAuthenticated = await _authRepository.isAuthenticated();
      if (isAuthenticated) {
        final user = await _authRepository.getStoredUser();
        if (user != null) {
          emit(AuthState.authenticated(user: user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }

  Future<void> _onUserRequested(
    AuthUserRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final user = await _authRepository.getCurrentUser();
      emit(AuthState.authenticated(user: user));
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }
}
