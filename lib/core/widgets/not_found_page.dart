import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../index.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: const Text(Strings.notFound),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 64),
            Text(Strings.pageNotFound),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 128),
              child: SvgPicture.asset(
                Assets.illustrations.notFound,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              },
              child: Text(Strings.backToHome),
            ),
          ],
        ),
      ),
    );
  }
}
