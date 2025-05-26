import 'package:local_services/features/services/entities/profile.dart';

abstract class ProfileFormEvent {}

class SubmitProfileEvent extends ProfileFormEvent {
  final Profile profile;

  SubmitProfileEvent({required this.profile});
}
