abstract class LoginFormEvent {}

class SubmitLoginFormEvent extends LoginFormEvent {
  final String email;
  final String password;

  SubmitLoginFormEvent({required this.email, required this.password});
}
