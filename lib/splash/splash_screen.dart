import 'package:flutter/material.dart';
import 'package:kekiku/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.favicon.image(width: 100, height: 100),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
