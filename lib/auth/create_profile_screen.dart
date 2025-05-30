import 'package:flutter/gestures.dart';

import '../core/index.dart';
import 'bloc/auth_cubit.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      buildWhen: (previous, current) {
        switch (current) {
          case AuthState.form:
            return false;
        }
        return true;
      },
      builder: (context, state) {
        final isLoading = switch (state) {
          AuthLoading() => true,
          _ => false,
        };
        final cubit = context.read<AuthCubit>();
        final formKey = GlobalKey<FormState>();
        return MyScaffold(
          appBar: AppBar(
            title: const Text(Strings.createProfile),
          ),
          body: isLoading
              ? const MyLoading()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(Dimens.large),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          enabled: false,
                          initialValue: cubit.emailController.text,
                          decoration: InputDecoration(
                            labelText: cubit.isUsingEmail
                                ? Strings.email
                                : Strings.phoneNumber,
                          ),
                        ),
                        const SizedBox(height: Dimens.large),
                        TextFormField(
                          controller: cubit.userNameController,
                          onChanged: (value) {
                            cubit.validateForm(createProfileKey: formKey);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: Strings.fullName,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z\s]'),
                            ),
                          ],
                          validator: Validators.required,
                        ),
                        if (cubit.isUsingEmail) ...[
                          const SizedBox(height: Dimens.large),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: cubit.passwordController,
                            onChanged: (value) {
                              cubit.validateForm(createProfileKey: formKey);
                            },
                            validator: Validators.password,
                            inputFormatters: [
                              InputFormatter.password(),
                            ],
                            obscureText: !cubit.showPassword,
                            decoration: InputDecoration(
                              labelText: Strings.password,
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
                        ],
                        const SizedBox(height: Dimens.large),
                        BlocSelector<AuthCubit, AuthState, bool>(
                          selector: (state) => false,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: cubit.isFormValid
                                  ? () {
                                      cubit.createProfile();
                                    }
                                  : null,
                              child: const Text(Strings.createProfile),
                            );
                          },
                        ),
                        const SizedBox(height: Dimens.large),
                        // Terms and conditions that can be clicked
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.large),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: Strings.byContinuing,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: Dimens.medium,
                                  ),
                              children: [
                                TextSpan(
                                  text: Strings.termsAndConditions,
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pushNamed(
                                        Routes.termsAndConditions,
                                      );
                                    },
                                ),
                                const TextSpan(text: Strings.and),
                                TextSpan(
                                  text: Strings.privacyPolicy,
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pushNamed(
                                        Routes.termsAndConditions,
                                      );
                                    },
                                ),
                              ],
                            ),
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
