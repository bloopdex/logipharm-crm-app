import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/auth/auth_bloc.dart';
import '../../../logic/localizations/localizations_bloc.dart';
import '../../../shared/widgets/inputs/password.text.field.widget.dart';
import '../../../shared/widgets/loading/custom_loading.widget.dart';
import '../../auth/widget/login.button.widget.dart';
import '../cubits/change_password_cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String routeName = '/auth.signin';
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  Map<String, String> changeData = {
    'oldpassword': '',
    'newpassword': '',
    'confirm-newpassword': '',
  };

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () => context.pushNamedAndRemoveUntil('/layout'),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: canPop
              ? IconButton(
                  onPressed: () => context.pop(),
                  icon: BlocBuilder<LocalizationsBloc, LocalizationsState>(
                    builder: (context, state) {
                      return Icon(
                        state.locale.languageCode != 'ar'
                            ? Icons.chevron_left
                            : Icons.chevron_right,
                        size: 20.h,
                      );
                    },
                  ),
                )
              : null,
          title: Text(
            context.i10n.changePassword,
            style: context.textTheme.headlineMedium,
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: kSpacingX6),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: context.width,
                minHeight: context.height,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.i10n.oldPassword,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    PasswordTextField(
                      data: changeData,
                      mapKey: 'oldPassword',
                      prefixIcon: Icons.lock,
                    ),
                    SizedBox(height: kSpacingX2),
                    Text(
                      context.i10n.newPassword,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    PasswordTextField(
                      data: changeData,
                      mapKey: 'newPassword',
                      prefixIcon: Icons.lock,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return context.i10n.newPasswordRequired;
                        }
                        if (value.length < 6) {
                          return context.i10n.passwordLengthError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX2),
                    Text(
                      context.i10n.confirmPassword,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    PasswordTextField(
                      data: changeData,
                      mapKey: 'confirmNewPassword',
                      prefixIcon: Icons.lock,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return context.i10n.confirmPasswordRequired;
                        }
                        if (value.length < 6) {
                          return context.i10n.passwordLengthError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX2),
                    BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          error: (message) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error,
                                color: kCardinal,
                              ),
                              SizedBox(width: kSpacingX2),
                              Text(
                                context.i10n.passwordChangedFailed,
                                style: context.textTheme.bodyMedium!.copyWith(color: kCardinal),
                              )
                            ],
                          ),
                          orElse: SizedBox.shrink,
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX8),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(child: CustomLoader()),
                          orElse: () => LoginButton(
                            onPressed: change,
                            text: context.i10n.changePassword,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void change() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState != null && formKey.currentState!.validate()) {
      formKey.currentState?.save();
      if (changeData['oldPassword']!.isEmpty) {
        context.errorSnackBar(context.i10n.oldPasswordRequired);
        return;
      }
      if (changeData['newPassword']!.isEmpty) {
        context.errorSnackBar(context.i10n.newPasswordRequired);
        return;
      }
      if (changeData['confirmNewPassword']!.isEmpty) {
        context.errorSnackBar(context.i10n.confirmPasswordRequired);
        return;
      }
      if (changeData['confirmNewPassword'] != changeData['newPassword']) {
        context.errorSnackBar(context.i10n.passwordNotMatch);
        return;
      }
      context.read<ChangePasswordCubit>().changePassword({
        'oldPassword': changeData['oldPassword']!,
        'newPassword': changeData['newPassword']!,
        'confirmNewPassword': changeData['confirmNewPassword']!,
      });
    }
  }
}
