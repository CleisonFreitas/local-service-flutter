import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/features/auth/password_recovery/bloc/events/submit_email_recovery_event.dart';
import 'package:local_services/features/auth/password_recovery/bloc/state/email_recovery_state.dart';

class EmailRecoveryLogic extends Bloc<EmailRecoveryEvent, BaseState> {
  EmailRecoveryLogic() : super(EmailRecoveryInitial()) {
    on<SubmitEmailRecoveryEvent>((event, emit) async {
      emit(EmailRecoveryLoading());

      try {
        await Future.delayed(Duration(seconds: 2), () {
          emit(EmailRecoverySuccess('Form submitted successfully'));
        });
      } catch (e) {
        emit(EmailRecoveryFailure('Something goes wrong!'));
      }
    });
  }
}
