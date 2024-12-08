import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/index.dart';
import 'item_product.dart';

class ListInfiniteProduct extends StatelessWidget {
  const ListInfiniteProduct(
      {super.key, this.products = const [], required this.pagingController});

  final List<Product> products;
  final PagingController<int, Product> pagingController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
            product: product,
            imageSize: size,
          ),
          newPageProgressIndicatorBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          noItemsFoundIndicatorBuilder: (_) =>
              const Center(child: Text(Strings.noItemsFound)),
        ),
      ),
    );
  }
}
