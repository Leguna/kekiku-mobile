import 'package:kekiku/product/bloc/product_cubit.dart';

import '../../core/index.dart';
import 'small_product_card.dart';

class HomeListHorizontalProduct extends StatelessWidget {
  const HomeListHorizontalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<ProductCubit>();
    c.getPopularProducts();
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 1, thickness: 1),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Popular Products',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  for (var i = 0; i < c.popularProducts.length; i++) ...[
                    ProductCard(
                      product: c.popularProducts[i],
                    ),
                    const SizedBox(width: 16),
                  ]
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
