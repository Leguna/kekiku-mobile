import 'package:flutter_svg/flutter_svg.dart';
import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/core/index.dart';

class GoogleSsoButton extends StatelessWidget {
  const GoogleSsoButton({
    super.key,
    this.isOutlined = false,
    this.onSignIn,
  });

  final bool isOutlined;
  final Function? onSignIn;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state) {
          case AuthUserUpdated(user: var user):
            if (user != null) {
              context.read<AuthCubit>().setUser(user);
            }
            break;
        }
      },
      builder: (context, state) {
        var bloc = context.read<AuthCubit>();
        var isSignedIn = bloc.user != null;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            isSignedIn ? const SizedBox() : _buildSignInButton(bloc, context),
            _buildLogoutButton(bloc),
          ],
        );
      },
    );
  }

  _buildSignInButton(AuthCubit bloc, context) {
    return isOutlined
        ? OutlinedButton(
            onPressed: () {
              bloc.loginWithGoogle();
            },
            child: _buttonChild(context),
          )
        : ElevatedButton(
            onPressed: () {
              bloc.loginWithGoogle();
            },
            child: _buttonChild(context),
          );
  }

  _buttonChild(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          Assets.logoGoogleSvg.path,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Text(
          Strings.google,
          style: TextStyle(
            color: isOutlined ? Theme.of(context).colorScheme.onPrimary : null,
          ),
        ),
      ],
    );
  }

  _buildLogoutButton(AuthCubit bloc) {
    if (bloc.user == null) {
      return const SizedBox();
    }
    return ElevatedButton(
      onPressed: () {
        bloc.logout();
      },
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout),
          SizedBox(width: 8),
          Text(Strings.signOut),
        ],
      ),
    );
  }
}
