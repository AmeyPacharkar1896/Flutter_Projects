abstract class UserEvent {
  const UserEvent();
}

class UserEventGetUser extends UserEvent {}

class UserEventLogin extends UserEvent {
  const UserEventLogin({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;
}