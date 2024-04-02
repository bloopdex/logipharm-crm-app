import 'package:flutter/services.dart';

import '../../core/extension.dart';
import 'widget/login.button.widget.dart';
import '../navigation/cubit/navigation_cubit.dart';
import '../../shared/widgets/image/custom_local_image.widget.dart';
import '../../shared/widgets/inputs/custom.text.form.field.widget.dart';
import '../../shared/widgets/inputs/password.text.field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const.dart';
import '../../logic/auth/auth_bloc.dart';
import '../../shared/widgets/loading/custom_loading.widget.dart';
import 'bloc/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/auth.signin';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> loginData = {
    'username': 'YA.SI-MOUSSA',
    'password': '123',
  };
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<NavigationCubit>().home();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (user, tempError) =>
              context.pushNamedAndRemoveUntil('/layout'),
        );
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(kSpacingX6),
              constraints: BoxConstraints(
                minWidth: context.width,
                minHeight: context.height,
                maxHeight: context.height,
                maxWidth: context.width,
              ),
              child: Form(
                key: formKey,
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 3),
                      CustomLocalImage(
                        width: 100.sp,
                        image: 'logo.png',
                      ),
                      SizedBox(height: kSpacingX8),
                      Text(
                        context.i10n.authLoginTitle,
                        style: context.textTheme.headlineLarge,
                      ),
                      Text(
                        context.i10n.authLoginDescription,
                        style: context.textTheme.bodyMedium,
                      ),
                      SizedBox(height: kSpacingX8),
                      Text(
                        context.i10n.authLoginUsername,
                        style: context.textTheme.headlineSmall,
                      ),
                      SizedBox(height: kSpacingX1),
                      CustomTextFormField(
                        data: loginData,
                        mapKey: 'username',
                        initialValue: loginData['username'],
                        hintText: context.i10n.authLoginUsernamePlaceholder,
                        autoFillHints: const [AutofillHints.username],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return context.i10n.authLoginPasswordRequired;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: kSpacingX5),
                      Text(
                        context.i10n.authLoginPassword,
                        style: context.textTheme.headlineSmall,
                      ),
                      SizedBox(height: kSpacingX1),
                      PasswordTextField(
                        data: loginData,
                        initialValue: loginData['password'],
                        mapKey: 'password',
                        hintText: context.i10n.authLoginPasswordPlaceholder,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return context.i10n.authLoginPasswordRequired;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: kSpacingX5),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            failure: (message) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.highlight_remove_rounded,
                                  color: kCardinal,
                                ),
                                SizedBox(width: kSpacingX5),
                                Expanded(
                                  child: Text(
                                    message,
                                    maxLines: 2,
                                    softWrap: true,
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(color: kCardinal),
                                  ),
                                )
                              ],
                            ),
                            orElse: SizedBox.shrink,
                          );
                        },
                      ),
                      const Spacer(flex: 5),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const Center(child: CustomLoader()),
                            orElse: () => LoginButton(
                              onPressed: login,
                              text: context.i10n.authLoginSubmit,
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
      ),
    );
  }

  void login() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState != null && formKey.currentState!.validate()) {
      formKey.currentState?.save();
      TextInput.finishAutofillContext();
      context.read<LoginBloc>().add(LoginEvent.login(
            username: loginData['username']!,
            password: loginData['password']!,
          ));
    }
  }
}
