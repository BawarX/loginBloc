abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  String? username;
  String? password;
  LoginButtonPressed({required this.username, required this.password});
}
