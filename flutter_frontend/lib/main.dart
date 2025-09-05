import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/repositories/auth_repository.dart';
import 'core/theme/app_theme.dart';
import 'src/Auth/bloc/auth_bloc.dart';
import 'src/Auth/bloc/auth_event.dart';
import 'src/Auth/bloc/auth_state.dart';
import 'src/Auth/screens/login_screen.dart';
import 'src/Home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(authRepository: AuthRepository())
                ..add(const AuthEvent.statusChecked()),
        ),
      ],
      child: MaterialApp(
        title: 'Laravel Blog App',
        theme: AppTheme.lightTheme,
        home: const AuthWrapper(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => const LoginScreen(),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          authenticated: (user) => const HomeScreen(),
          unauthenticated: () => const LoginScreen(),
          failure: (message) => const LoginScreen(),
          success: (message, user) => const HomeScreen(),
        );
      },
    );
  }
}
