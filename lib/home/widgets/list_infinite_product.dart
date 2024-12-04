import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/index.dart';
import 'item_product.dart';

class ListInfiniteProduct extends StatelessWidget {
  const ListInfiniteProduct({super.key, this.products = const []});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final pagingController = PagingController<int, Product>(
      firstPageKey: 0,
    );
    final size = MediaQuery.of(context).size.width / 2;
    pagingController.appendLastPage(products);
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
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
              const Center(child: Text('No items found')),
        ),
      ),
    );
  }
}
