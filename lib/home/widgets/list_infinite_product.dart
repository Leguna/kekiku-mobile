import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';

import '../../core/index.dart';
import 'item_product.dart';

class ListInfiniteProduct extends StatelessWidget {
  const ListInfiniteProduct({
    super.key,
    this.showFavorite = true,
    required this.onNextPage,
    required this.state,
  });

  final bool showFavorite;

  final Function() onNextPage;
  final PagingState<int, Product> state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: PagedGridView<int, Product>(
        state: state,
        fetchNextPage: onNextPage,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
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
