import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/auth/views/google_sso_button.dart';
import 'package:kekiku/core/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final cubit = context.read<AuthCubit>();
    cubit.formKey = formKey;
    return BlocConsumer<AuthCubit, AuthState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          orElse: () => false,
          loading: () => true,
          success: (user) => true,
          error: (message) => true,
          initial: () => true,
          checked: (isEmail) => true,
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (message) {
            showMySnackBar(
              context,
              message,
              error: false,
            );
          },
          updated: (user) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          },
          error: (message) {
            showMySnackBar(context, message);
          },
          checked: (isEmail) {
            cubit.isUsingEmail = isEmail;
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        final isEmailLogin = cubit.isUsingEmail;
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
                  padding: const EdgeInsets.all(Dimens.small),
                  child: Form(
                    onChanged: () {
                      context.read<AuthCubit>().validateForm();
                    },
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
                                  onFieldSubmitted: (value) {
                                    cubit.checkEmailOrPhone();
                                  },
                                ),
                                const SizedBox(height: Dimens.medium),
                              ],
                              if (isEmailLogin) ...[
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
                                  onFieldSubmitted: (value) {
                                    cubit.trySendVerificationMessage();
                                  },
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
                                  onFieldSubmitted: (value) {
                                    cubit.login();
                                  },
                                  decoration: InputDecoration(
                                    label: const Text(Strings.password),
                                    suffixIcon: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        cubit.togglePassword();
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
                                  final cubit = context.read<AuthCubit>();
                                  return ElevatedButton(
                                    onPressed: cubit.isFormValid
                                        ? () {
                                            if (!isEmailLogin) {
                                              FocusScope.of(context).unfocus();
                                              cubit.checkEmailOrPhone();
                                            } else {
                                              cubit.login();
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
                        // OutlinedButton(
                        //   onPressed: () {
                        //     context.read<AuthCubit>().loginFingerprint();
                        //   },
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.fingerprint,
                        //         color: Theme.of(context).colorScheme.onPrimary,
                        //       ),
                        //       const SizedBox(width: Dimens.micro),
                        //       Text(
                        //         Strings.fingerPrint,
                        //         style: TextStyle(
                        //           color:
                        //               Theme.of(context).colorScheme.onPrimary,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const GoogleSsoButton(
                          isOutlined: true,
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
