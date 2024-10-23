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
                    // Show a dialog to confirm logout
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(Strings.logout),
                          content: const Text(Strings.logoutConfirmation),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(Strings.cancel),
                            ),
                            TextButton(
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
                                color:
                                Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                        GoogleSsoButton(
                          onSignIn: () =>
                              context.read<AuthCubit>().loginWithGoogle(),
                          onSignOut: () => context.read<AuthCubit>().logout(),
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
