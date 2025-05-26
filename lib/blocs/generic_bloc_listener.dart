import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/shared/components/custom_snackbar.dart';

class GenericBlocListener<B extends BlocBase<S>, S extends BaseState>
    extends StatelessWidget {
  final Widget child;
  final void Function(BuildContext context, S state)? onSuccess;
  final void Function(BuildContext context, S state)? onFailure;

  const GenericBlocListener({
    super.key,
    required this.child,
    this.onSuccess,
    this.onFailure,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: (context, state) {
        if (state is BaseSuccess) {
          CustomSnackBar.showSuccess(context, state.message);

          onSuccess?.call(context, state);
        } else if (state is BaseFailure) {
          CustomSnackBar.showError(context, state.message);
          onFailure?.call(context, state);
        }
      },
      child: child,
    );
  }
}
