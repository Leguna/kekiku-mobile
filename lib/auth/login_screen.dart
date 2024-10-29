import 'package:flutter/material.dart';
import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/core/index.dart';
import 'package:kekiku/core/widgets/google_sso_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().reset();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          checked: (isEmail) {
            if (!isEmail) {
              Navigator.pushNamed(context, Routes.verifyCode);
            }
          },
          updated: (user) {
            if (user != null) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            }
          },
          success: (message) {
            showMySnackBar(
              context,
              message,
              error: false,
            );
          },
          error: (message) {
            showMySnackBar(
              context,
              message,
            );
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
        final isLoading = state.maybeWhen(
          orElse: () => false,
          loading: () => true,
        );
        final cubit = context.read<AuthCubit>();
        final isEmailLogin = cubit.isUsingEmail;
        final isFormValid =
            context.select((AuthCubit cubit) => cubit.isFormValid);
        final formKey = GlobalKey<FormState>();
        cubit.formKey = formKey;
        return MyScaffold(
          appBar: MyAppBar(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.register);
                },
                child: const Text(Strings.register),
              ),
            ],
          ),
          body: isLoading
              ? const MyLoading()
              : SingleChildScrollView(
                  padding: Dimens.mediumPadding,
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        state.maybeWhen(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          orElse: () => Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(Strings.signInWith),
                              const SizedBox(height: Dimens.medium),
                              if (!isEmailLogin) ...[
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
                              ],
                              if (isEmailLogin) ...[
                                // Email Form
                                TextFormField(
                                  controller: cubit.emailController,
                                  onChanged: (value) {
                                    context.read<AuthCubit>().validateForm();
                                  },
                                  inputFormatters: [
                                    InputFormatter.emailOrPhone(),
                                  ],
                                  validator: Validators.email,
                                  decoration: const InputDecoration(
                                    label: Text(Strings.email),
                                  ),
                                ),
                                const SizedBox(height: Dimens.medium),
                                TextFormField(
                                  controller: cubit.passwordController,
                                  onChanged: (value) {
                                    context.read<AuthCubit>().validateForm();
                                  },
                                  validator: Validators.password,
                                  inputFormatters: [
                                    InputFormatter.password(),
                                  ],
                                  obscureText: !cubit.showPassword,
                                  decoration: InputDecoration(
                                    label: const Text(Strings.password),
                                    suffixIcon: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        context
                                            .read<AuthCubit>()
                                            .togglePassword();
                                      },
                                      child: Icon(
                                        cubit.showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: Dimens.medium),
                              ],
                              BlocSelector<AuthCubit, AuthState, bool>(
                                selector: (state) {
                                  return state.maybeWhen(
                                    orElse: () => false,
                                    form: (email, password, valid) => valid,
                                  );
                                },
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: isFormValid
                                        ? () {
                                            if (!isEmailLogin) {
                                              FocusScope.of(context).unfocus();
                                              context
                                                  .read<AuthCubit>()
                                                  .tryVerification();
                                            } else {
                                              context.read<AuthCubit>().login();
                                            }
                                          }
                                        : null,
                                    child: Text(
                                      cubit.isUsingEmail
                                          ? Strings.signIn
                                          : Strings.next,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const MyDivider(Strings.orSignInWith),
                        OutlinedButton(
                          onPressed: () {
                            context.read<AuthCubit>().loginFingerprint();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fingerprint,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              const SizedBox(width: Dimens.micro),
                              Text(
                                Strings.fingerPrint,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
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
