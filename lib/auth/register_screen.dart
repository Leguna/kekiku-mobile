import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/auth/views/google_sso_button.dart';
import 'package:kekiku/core/index.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state) {
          case AuthChecked(isEmail: final isEmail):
            Navigator.pushNamed(context, Routes.verifyCode, arguments: {
              Routes.isEmail: isEmail,
            });
            break;
          case AuthUserUpdated(user: final user):
            if (user != null) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            }
            break;
          case AuthSuccess(message: final message):
            showMySnackBar(context, message, error: false);
            break;
          case AuthError(message: final message):
            showMySnackBar(context, message);
            break;
        }
      },
      buildWhen: (previous, current) {
        return switch (current) {
          AuthState.form => false,
          _ => true,
        };
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        cubit.formKey = GlobalKey<FormState>();
        final isLoading = switch (state) {
          AuthState.loading => true,
          _ => false,
        };
        return Stack(
          children: [
            MyScaffold(
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
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(Dimens.small),
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
                          cubit.validateForm();
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
                          return switch (state) {
                            FormUpdated(:final valid) => valid,
                            _ => false,
                          };
                        },
                        builder: (context, state) {
                          final bool valid = context
                              .select((AuthCubit cubit) => cubit.isFormValid);
                          return ElevatedButton(
                            onPressed: valid
                                ? () {
                                    FocusScope.of(context).unfocus();
                                    cubit.trySendVerificationMessage(
                                        isRegister: true);
                                  }
                                : null,
                            child: const Text(Strings.register),
                          );
                        },
                      ),
                      const MyDivider(Strings.orSignUpWith),
                      const GoogleSsoButton(isOutlined: true),
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
            ),
            if (isLoading) const MyLoading(),
          ],
        );
      },
    );
  }
}
