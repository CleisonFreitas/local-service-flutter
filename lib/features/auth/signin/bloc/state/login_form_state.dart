import 'package:local_services/blocs/base_state.dart';

class LoginFormInitial extends BaseInitial {}

class LoginFormLoading extends BaseLoading {}

class LoginFormSuccess extends BaseSuccess {
  LoginFormSuccess(super.message);
}

class LoginFormFailure extends BaseFailure {
  LoginFormFailure(super.message);
}
