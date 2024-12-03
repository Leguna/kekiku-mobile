import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../core/index.dart';
import 'bloc/auth_cubit.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          orElse: () => false,
          loading: () => true,
        );
        final cubit = context.read<AuthCubit>();
        return MyScaffold(
          appBar: AppBar(
            title: const Text(Strings.createProfile),
          ),
          body: isLoading
              ? const MyLoading()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(Dimens.medium),
                  child: Form(
                    key: cubit.createProfileKey,
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
                        const SizedBox(height: Dimens.medium),
                        TextFormField(
                          controller: cubit.userNameController,
                          onChanged: (value) {
                            context.read<AuthCubit>().validateForm(
                                createProfileKey: cubit.createProfileKey);
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
                          const SizedBox(height: Dimens.medium),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: cubit.passwordController,
                            onChanged: (value) {
                              context.read<AuthCubit>().validateForm(
                                    createProfileKey: cubit.createProfileKey,
                                  );
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
                                  context.read<AuthCubit>().togglePassword();
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
                        const SizedBox(height: Dimens.medium),
                        BlocSelector<AuthCubit, AuthState, bool>(
                          selector: (state) {
                            return state.maybeWhen(
                              orElse: () => false,
                              form: (email, password, valid) => valid,
                            );
                          },
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
                        const SizedBox(height: Dimens.medium),
                        // Terms and conditions that can be clicked
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.medium),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: Strings.byContinuing,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: Dimens.small,
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
