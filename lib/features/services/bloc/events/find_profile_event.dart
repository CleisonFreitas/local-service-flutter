import 'package:local_services/features/services/bloc/events/profile_form_event.dart';

class FindProfileEvent extends ProfileFormEvent {
  final int profileId;

  FindProfileEvent({required this.profileId});
}
