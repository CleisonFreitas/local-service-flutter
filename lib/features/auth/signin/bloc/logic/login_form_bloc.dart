import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/features/auth/signin/bloc/events/login_form_event.dart';
import 'package:local_services/features/auth/signin/bloc/state/login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, BaseState> {
  LoginFormBloc() : super(LoginFormInitial()) {
    on<SubmitLoginFormEvent>((event, emit) async {
      emit(LoginFormLoading());

      try {
        await Future.delayed(Duration(seconds: 2));
        emit(LoginFormSuccess('Success to submit the login'));
      } catch (e) {
        emit(LoginFormFailure('Failed to submit the form'));
      }
    });
  }
}
