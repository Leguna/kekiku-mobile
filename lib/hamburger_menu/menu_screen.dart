
import '../auth/views/profile_summary.dart';
import '../core/index.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, this.showLeading = true});

  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: showLeading
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: const Text(Strings.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileSummary(
              onTap: () {
                if (showLeading) {
                  Navigator.pushReplacementNamed(context, Routes.profile);
                }
                Navigator.pushNamed(context, Routes.profile);
              },
            ),
            const Divider(),
            ListTile(
              enabled: false,
              title: const Text(Strings.orders),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
            ListTile(
              enabled: false,
              title: const Text(Strings.reviews),
              leading: const Icon(Icons.star),
              onTap: () {
                Navigator.pushNamed(context, '/reviews');
              },
            ),
            ListTile(
              enabled: false,
              title: const Text(Strings.cart),
              leading: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              enabled: false,
              title: const Text(Strings.wishlist),
              leading: const Icon(Icons.favorite),
              onTap: () {
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
            const Divider(),
            ListTile(
              enabled: false,
              onTap: () {
                Navigator.pushNamed(context, '/privacy');
              },
              title: const Text(Strings.privacyPolicy),
              leading: const Icon(Icons.privacy_tip),
            ),
            ListTile(
              enabled: false,
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
              title: const Text(Strings.helpAndFeedback),
              leading: const Icon(Icons.help),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, Routes.codeScanner);
              },
              title: const Text(Strings.codeScanner),
              leading: const Icon(Icons.qr_code),
            ),
          ],
        ),
      ),
    );
  }
}
