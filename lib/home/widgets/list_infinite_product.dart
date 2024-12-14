import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';

import '../../core/index.dart';
import 'item_product.dart';

class ListInfiniteProduct extends StatelessWidget {
  const ListInfiniteProduct({
    super.key,
    this.products = const [],
    required this.pagingController,
    this.showFavorite = true,
  });

  final List<Product> products;
  final PagingController<int, Product> pagingController;
  final bool showFavorite;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: PagedGridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (context, product, index) => ItemProduct(
            showFavorite: showFavorite,
            product: product,
            imageSize: size,
          ),
          newPageProgressIndicatorBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          noItemsFoundIndicatorBuilder: (_) => Center(
              child: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  Assets.lotties.notfound,
                  reverse: true,
                ),
                Text(
                  Strings.noItemsFound,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
