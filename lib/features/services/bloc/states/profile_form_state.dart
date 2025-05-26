import 'package:local_services/blocs/base_state.dart';

class ProfileFormInitial extends BaseInitial {}

class ProfileFormLoading extends BaseLoading {}

class ProfileFormSuccess extends BaseSuccess {
  ProfileFormSuccess(super.message);
}

class ProfileFormError extends BaseFailure {
  ProfileFormError(super.message);
}
