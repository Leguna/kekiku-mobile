import 'package:flutter/material.dart';
import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/core/index.dart';
import 'package:kekiku/core/widgets/google_sso_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          checked: (isEmail) {
            Navigator.pushNamed(context, Routes.verifyCode, arguments: {
              Routes.isEmail: isEmail,
            });
            context.read<AuthCubit>().resend();
          },
          updated: (user) {
            if (user != null) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            }
          },
          success: (message) {
            showMySnackBar(context, message, error: false);
          },
          error: (message) {
            showMySnackBar(context, message);
          },
        );
      },
      buildWhen: (previous, current) {
        return current.maybeWhen(
          orElse: () => true,
          form: (email, password, valid) => false,
        );
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        cubit.formKey = GlobalKey<FormState>();
        final isLoading = state.maybeWhen(
          orElse: () => false,
          loading: () => true,
        );
        return MyScaffold(
          appBar: MyAppBar(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: const Text(Strings.login),
              ),
            ],
          ),
          body: isLoading
              ? const MyLoading()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(Dimens.medium),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(Strings.signUpWith),
                        const SizedBox(height: Dimens.medium),
                        TextFormField(
                          controller: cubit.emailController,
                          onChanged: (value) {
                            context.read<AuthCubit>().validateForm();
                          },
                          inputFormatters: [
                            InputFormatter.emailOrPhone(),
                          ],
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.emailOrPhone,
                          decoration: const InputDecoration(
                            labelText: Strings.emailOrPhone,
                            helperText: Strings.examplePhone,
                          ),
                        ),
                        const SizedBox(height: Dimens.medium),
                        BlocSelector<AuthCubit, AuthState, bool>(
                          selector: (state) {
                            return state.maybeWhen(
                              orElse: () => false,
                              form: (email, password, valid) => valid,
                            );
                          },
                          builder: (context, state) {
                            final bool valid = context
                                .select((AuthCubit cubit) => cubit.isFormValid);
                            return ElevatedButton(
                              onPressed: valid
                                  ? () {
                                      FocusScope.of(context).unfocus();
                                      context
                                          .read<AuthCubit>()
                                          .tryVerification();
                                    }
                                  : null,
                              child: const Text(Strings.register),
                            );
                          },
                        ),
                        const MyDivider(Strings.orSignUpWith),
                        GoogleSsoButton(
                          isOutlined: true,
                          onSignIn: () {
                            context.read<AuthCubit>().loginWithGoogle();
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.all(Dimens.micro)),
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.help);
                            },
                            child: const Text(Strings.needHelp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
