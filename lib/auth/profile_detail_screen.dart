import 'package:flutter/material.dart';
import 'package:kekiku/core/index.dart';

import 'bloc/auth_cubit.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: AppBar(
          title: const Text('Profile Detail'),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loggedOut: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
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
                ),
              ],
            );
          },
        ));
  }
}
