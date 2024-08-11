import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/email_and_password/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/email_and_password/shared/show_snackbar.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(isLoading: false, isAuthenticated: false)) {
    on<AuthEventRegister>(_onAuthEventRegister);
    on<AuthEventLogin>(_onAuthEventLogin);
    on<AuthEventLogout>(_onAuthEventLogout);
  }

  final _authService = AuthFireBaseService();

  Future<FutureOr<void>> _onAuthEventRegister(
    AuthEventRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _authService.createAccount(
      emailAddress: event.emailAddress,
      password: event.password,
    );
    response.fold(
      (left) => {
        showSnackbar(left),
        emit(
          state.copyWith(isLoading: false, isAuthenticated: false),
        ),
      },
      (right) => {
        emit(
          state.copyWith(isLoading: false, isAuthenticated: false),
        ),
      },
    );
  }

  Future<FutureOr<void>> _onAuthEventLogin(
    AuthEventLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _authService.login(
      emailAddress: event.emailAddress,
      password: event.password,
    );
    response.fold(
      (left) => {
        showSnackbar(left),
        emit(
          state.copyWith(isLoading: false, isAuthenticated: false),
        )
      },
      (right) => {
        emit(
          state.copyWith(isLoading: false, isAuthenticated: true),
        ),
      },
    );
  }

  Future<FutureOr<void>> _onAuthEventLogout(
    AuthEventLogout event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _authService.logout();
    response.fold(
      (left) {
        showSnackbar(left);
        emit(
          state.copyWith(isLoading: false, isAuthenticated: false),
        );
      },
      (right) {
        emit(
          state.copyWith(isLoading: false, isAuthenticated: false),
        );
      },
    );
  }
}
