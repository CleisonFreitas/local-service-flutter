import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/features/services/entities/profile.dart';

class ProfileFormInitial extends BaseInitial {}

class ProfileFormLoading extends BaseLoading {}

class ProfileFormSuccess extends BaseSuccess {
  ProfileFormSuccess(super.message);
}

class ProfileFormLoaded extends BaseLoaded {
  final Profile profile;

  ProfileFormLoaded(this.profile) : super(null);
}

class ProfileFormError extends BaseFailure {
  ProfileFormError(super.message);
}
