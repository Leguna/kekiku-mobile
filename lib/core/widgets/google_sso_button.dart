import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kekiku/core/index.dart';

class GoogleSsoButton extends StatelessWidget {
  const GoogleSsoButton({
    super.key,
    this.showLogout = false,
    this.onSignIn,
    this.onSignOut,
    this.isSignedIn = false,
  });

  final bool showLogout;
  final bool isSignedIn;
  final Function? onSignIn;
  final Function? onSignOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        isSignedIn ? const SizedBox() : _buildSignInButton(),
        _buildSignOutButton(),
      ],
    );
  }

  _buildSignInButton() {
    return ElevatedButton(
      onPressed: () {
        onSignIn?.call();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.logoGoogleSvg,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          const Text(Strings.signInWithGoogle),
        ],
      ),
    );
  }

  _buildSignOutButton() {
    if (!showLogout) {
      return const SizedBox();
    }
    return ElevatedButton(
      onPressed: onSignOut as void Function()?,
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
