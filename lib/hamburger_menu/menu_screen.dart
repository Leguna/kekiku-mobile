import 'package:flutter/material.dart';

import '../core/index.dart';
import 'login_buttons.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Main Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginButtons(),
            const Divider(),
            ListTile(
              title: Text(Strings.orders),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
            ListTile(
              title: Text(Strings.reviews),
              leading: const Icon(Icons.star),
              onTap: () {
                Navigator.pushNamed(context, '/reviews');
              },
            ),
            ListTile(
              title: Text(Strings.cart),
              leading: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              title: Text(Strings.wishlist),
              leading: const Icon(Icons.favorite),
              onTap: () {
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/privacy');
              },
              title: Text(Strings.privacyPolicy),
              leading: const Icon(Icons.privacy_tip),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
              title: Text(Strings.helpAndFeedback),
              leading: const Icon(Icons.help),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              title: Text(Strings.scanQrCode),
              leading: const Icon(Icons.qr_code),
            ),
          ],
        ),
      ),
    );
  }
}
