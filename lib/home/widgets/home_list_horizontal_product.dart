import 'package:kekiku/product/bloc/product_cubit.dart';

import '../../core/index.dart';
import 'small_product_card.dart';

class HomeListHorizontalProduct extends StatelessWidget {
  const HomeListHorizontalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final product = switch (state) {
          ProductSuccess(:final popularProducts) => popularProducts,
          _ => [],
        };
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
                  for (var i = 0; i < product.length; i++) ...[
                    ProductCard(
                      product: product[i],
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
