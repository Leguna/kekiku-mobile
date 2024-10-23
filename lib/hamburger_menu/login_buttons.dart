import 'package:flutter/material.dart';
import 'package:kekiku/core/widgets/google_sso_button.dart';

import '../auth/bloc/auth_cubit.dart';
import '../core/index.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        final isLoggedIn =
            context.select((AuthCubit cubit) => cubit.isLoggedIn);
        return state.maybeWhen(
          loading: () {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          },
          orElse: () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                (isLoggedIn)
                    ? ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Center(
                                    child: Text(Strings.exitFromKekiku)),
                                content: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(Strings.logoutConfirmation),
                                  ],
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    child: Text(
                                      Strings.cancel,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      context.read<AuthCubit>().logout();
                                    },
                                    child: const Text(Strings.logout),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        title: const Text(Strings.logout),
                        leading: const Icon(Icons.logout),
                      )
                    : Padding(
                        padding: Dimens.smallPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ...[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.login);
                                },
                                child: const Text(Strings.login),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.register);
                                },
                                child: Text(
                                  Strings.register,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                              ),
                              GoogleSsoButton(
                                onSignIn: () =>
                                    context.read<AuthCubit>().loginWithGoogle(),
                                onSignOut: () =>
                                    context.read<AuthCubit>().logout(),
                                isSignedIn: isLoggedIn,
                              ),
                            ]
                          ],
                        ),
                      ),
              ],
            );
          },
        );
      },
    );
  }
}
