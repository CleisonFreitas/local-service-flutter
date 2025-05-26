import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/features/services/bloc/events/profile_form_event.dart';
import 'package:local_services/features/services/bloc/logic/profile_form_bloc.dart';
import 'package:local_services/features/services/bloc/states/profile_form_state.dart';
import 'package:local_services/features/services/entities/profile.dart';
import 'package:local_services/features/services/validations/profile_validations.dart';
import 'package:local_services/shared/components/content_container.dart';
import 'package:local_services/shared/components/custom_button.dart';
import 'package:local_services/shared/components/custom_form_field.dart';
import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';
import 'package:local_services/shared/enums/button_enum.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _skillsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  void _sendForm() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileFormBloc>().add(
        SubmitProfileEvent(
          profile: Profile.create(
            _nameController.text,
            _bioController.text,
            _skillsController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: <Widget>[
            Wrap(
              spacing: 2,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              children: <Widget>[
                CustomTitle(title: 'Create a profile'),
                CustomSubtitle(
                  title:
                      "That's a important way of describing your qualification",
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomFormField(
                    controller: _nameController,
                    label: "What's your job occupation?",
                    validator: (value) {
                      final result = validateProfileNameField(value ?? '');
                      return result['firstError'];
                    },
                  ),
                  CustomFormField(
                    controller: _skillsController,
                    label:
                        "Inform your skills. Ex: mechanic, electrician... etc.",
                    validator: (value) {
                      final result = validateProfileSkillsField(value ?? '');
                      return result['firstError'];
                    },
                  ),
                  CustomFormField(
                    controller: _bioController,
                    label: "Give us a short description about you",
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    validator: (value) {
                      final result = validateProfileBioField(value ?? '');
                      return result['firstError'];
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<ProfileFormBloc, BaseState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: 'Send',
                        buttonEnum: ButtonEnum.secondary,
                        action: _sendForm,
                        isLoading: state is ProfileFormLoading,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
