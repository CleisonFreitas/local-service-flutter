import 'package:local_services/blocs/base_state.dart';

class EmailRecoveryInitial extends BaseInitial {}

class EmailRecoveryLoading extends BaseLoading {}

class EmailRecoverySuccess extends BaseSuccess {
  EmailRecoverySuccess(super.message);
}

class EmailRecoveryFailure extends BaseFailure {
  EmailRecoveryFailure(super.message);
}
