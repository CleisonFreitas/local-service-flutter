import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/features/services/bloc/events/find_profile_event.dart';
import 'package:local_services/features/services/bloc/events/profile_form_event.dart';
import 'package:local_services/features/services/bloc/states/profile_form_state.dart';
import 'package:local_services/features/services/data/profile_list.dart';

class ProfileFormBloc extends Bloc<ProfileFormEvent, BaseState> {
  ProfileFormBloc() : super(ProfileFormInitial()) {
    on<SubmitProfileEvent>((event, emit) async {
      emit(ProfileFormLoading());

      try {
        await Future.delayed(Duration(seconds: 2));

        emit(ProfileFormSuccess('Success to submit profile'));
      } catch (e) {
        emit(ProfileFormError('Failed to submit profile.'));
      }
    });

    on<FindProfileEvent>((event, emit) async {
      emit(ProfileFormLoading());

      try {
        final localProfile = await Future.delayed(Duration(seconds: 2), () {
          return profileList.firstWhere(
            (profile) => profile.id == event.profileId,
          );
        });
        emit(ProfileFormLoaded(localProfile));
      } catch (e) {
        emit(ProfileFormError('The profile id informed has not been found'));
      }
    });
  }
}
