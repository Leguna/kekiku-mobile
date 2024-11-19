import 'package:flutter/material.dart';

import '../../auth/bloc/auth_cubit.dart';
import '../index.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        final isLoggedIn =
            context.select((AuthCubit cubit) => cubit.user != null);
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
                          showMyDialogOption(
                            context,
                            title: Strings.exitFromKekiku,
                            description: Strings.logoutConfirmation,
                            confirmText: Strings.logout,
                            onConfirm: () => context.read<AuthCubit>().logout(),
                          );
                        },
                        title: const Text(Strings.logout),
                        leading: const Icon(Icons.logout),
                      )
                    : Padding(
                        padding:  const EdgeInsets.all( Dimens.small),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ...[
                              ElevatedButton(
                                onPressed: () {
                                  context.read<AuthCubit>().reset();
                                  Navigator.pushNamed(context, Routes.login);
                                },
                                child: const Text(Strings.login),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  context.read<AuthCubit>().reset();
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
