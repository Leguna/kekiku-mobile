import 'package:share_plus/share_plus.dart';

import '../../core/index.dart';
import '../../favorite/favorite_button.dart';

class DetailAppBar extends MyAppBar {
  const DetailAppBar(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      useDivider: false,
      actions: [
        IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, Routes.search);
          },
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(Icons.share),
          onPressed: () {
            Share.share(
                "${product.name} - ${product.price}\$ on ${Config.appName}");
          },
        ),
        FavoriteButton(
          product: product,
          borderRadius: BorderRadius.circular(Dimens.xlarge),
          backgroundColor: Colors.transparent,
        ),
        const IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.shopping_cart),
          onPressed: null,
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pushNamed(context, Routes.menu);
          },
        ),
      ],
    );
  }
}
