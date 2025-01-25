import 'package:lottie/lottie.dart';

import '../core/index.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: const MyAppBar(title: Text('Cart')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Assets.lotties.notfound),
              const Text('Cart is empty'),
            ],
          ),
        ),
      ),
    );
  }
}
