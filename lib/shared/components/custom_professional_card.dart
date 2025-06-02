import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/features/services/bloc/events/find_profile_event.dart';
import 'package:local_services/features/services/bloc/logic/profile_form_bloc.dart';
import 'package:local_services/features/services/bloc/states/profile_form_state.dart';

import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';

class CustomProfessionalCard {
  static Future<void> showModal(BuildContext context, int profileId) async {
    context.read<ProfileFormBloc>().add(FindProfileEvent(profileId: profileId));

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (bottomSheetContext) {
        final bloc = context.read<ProfileFormBloc>();
        return SizedBox(
          height: 700,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocProvider.value(
              value: bloc,
              child: BlocBuilder<ProfileFormBloc, BaseState>(
                builder: (context, state) {
                  if (state is ProfileFormLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (state is ProfileFormLoaded) {
                    final profile = state.profile;
                    return Column(
                      children: <Widget>[
                        Image.asset(
                          profile.urlImage ?? '',
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomTitle(title: profile.name),
                              CustomSubtitle(
                                title:
                                    "Services made: ${profile.servicesAmount}",
                              ),
                              const SizedBox(height: 50),
                              const Divider(),
                              const SizedBox(height: 10),
                              CustomTitle(title: profile.skills),
                              const SizedBox(height: 5),
                              CustomSubtitle(title: profile.bio),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  if (state is ProfileFormError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox(); // fallback for initial state
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
