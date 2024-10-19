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
        final isLoggedIn = context.select((AuthCubit cubit) => cubit.isLoggedIn);
        return Padding(
          padding: Dimens.smallPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              GoogleSsoButton(
                onSignIn: () => context.read<AuthCubit>().loginWithGoogle(),
                onSignOut: () => context.read<AuthCubit>().logout(),
                isSignedIn: isLoggedIn,
              ),
              ListTile(
                onTap: () {
                  context.read<AuthCubit>().logout();
                },
                title: Text(Strings.logout),
                leading: const Icon(Icons.logout),
              ),
            ],
          ),
        );
      },
    );
  }
}
