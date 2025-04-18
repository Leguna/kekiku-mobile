import 'package:share_plus/share_plus.dart';

import '../../cart/bloc/cart_cubit.dart';
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
        BlocSelector<CartCubit, CartState, int>(
          selector: (state) {
            if (state is CartLoaded) {
              return state.totalQuantity;
            }
            return 0;
          },
          builder: (context, totalQuantity) {
            return Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.cart);
                  },
                ),
                if (totalQuantity > 0)
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        '$totalQuantity',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
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
