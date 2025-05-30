abstract class EmailRecoveryEvent {}

class SubmitEmailRecoveryEvent extends EmailRecoveryEvent {
  final String email;
  SubmitEmailRecoveryEvent({required this.email});
}
