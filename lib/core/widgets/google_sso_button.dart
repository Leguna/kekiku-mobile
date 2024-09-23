import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kekiku/core/index.dart';

import '../services/google_sso.dart';

class GoogleSsoButton extends StatefulWidget {
  const GoogleSsoButton({super.key});

  @override
  State<GoogleSsoButton> createState() => _GoogleSsoButtonState();
}

class _GoogleSsoButtonState extends State<GoogleSsoButton> {
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    final googleService = getIt<GoogleSSOService>();

    return FutureBuilder(future: googleService.googleSignIn.isSignedIn(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      if (snapshot.hasError) {
        return const Text('Error');
      }

      isSignIn = snapshot.data as bool;

      return isSignIn ? _buildSignOutButton() : _buildSignInButton();
    });

  }

  _buildSignInButton() {
    return ElevatedButton(
      onPressed: () async {
        _handleSignIn();
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
          const Text('Sign in with Google'),
        ],
      ),
    );
  }

  _buildSignOutButton() {
    return ElevatedButton(
      onPressed: () async {
        _handleSignOut();
      },
      child: const Text('Sign out'),
    );
  }

  _handleSignIn() async {
    try {
      final googleService = getIt<GoogleSSOService>();
      await googleService.handleSignIn();
      await googleService.googleSignIn.signIn();
      setState(() {
        isSignIn = googleService.googleSignIn.currentUser != null;
      });
    } catch (error) {
      // Handle error
    }
  }

  _handleSignOut() async {
    try {
      final googleService = getIt<GoogleSSOService>();
      await googleService.googleSignIn.signOut();
      setState(() {
        isSignIn = googleService.googleSignIn.currentUser != null;
      });
    } catch (error) {
      // Handle error
    }
  }
}
