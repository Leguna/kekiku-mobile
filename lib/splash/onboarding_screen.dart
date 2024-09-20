import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kekiku/core/widgets/google_sso_button.dart';

import '../gen/assets.gen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add svg
            SvgPicture.asset(
              Assets.welcome,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 64),
            const Text('Welcome to Our Shop App'),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to the next screen
              },
              child: const Text('Get Started'),
            ),
            const SizedBox(height: 16),
            const GoogleSsoButton(),
          ],
        ),
      ),
    );
  }
}
