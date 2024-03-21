import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/toggle.cubit.logic.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.initialValue,
    this.data,
    this.validator,
    this.mapKey,
    this.hintText,
    this.prefixIcon,
  });
  final String? initialValue;
  final String? hintText;
  final Map<String, dynamic>? data;
  final String? Function(String?)? validator;
  final String? mapKey;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleCubit(),
      child: BlocBuilder<ToggleCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            autocorrect: false,
            obscureText: !state,
            initialValue: initialValue,
            onSaved: (newValue) => data![mapKey ?? 'password'] = newValue!,
            validator: validator,
            enableSuggestions: false,
            autofillHints: const [AutofillHints.password],
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: IconButton(
                icon: Icon(state
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined),
                onPressed: () {
                  context.read<ToggleCubit>().toggle();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
