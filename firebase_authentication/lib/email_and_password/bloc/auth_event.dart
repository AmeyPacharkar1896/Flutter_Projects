part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthEventRegister extends AuthEvent {
  AuthEventRegister({
    required this.emailAddress,
    required this.password,
  });

  final String emailAddress;
  final String password;
}

class AuthEventLogin extends AuthEvent {
  AuthEventLogin({
    required this.emailAddress,
    required this.password,
  });

  final String emailAddress;
  final String password;
}

class AuthEventLogout extends AuthEvent {}
