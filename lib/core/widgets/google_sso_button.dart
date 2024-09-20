import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kekiku/core/index.dart';

import '../services/google_sso.dart';

class GoogleSsoButton extends StatelessWidget {
  const GoogleSsoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          // Handle Google SSO
          final googleService = getIt<GoogleSSOService>();
          await googleService.handleSignIn();
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
      ),
    );
  }
}
