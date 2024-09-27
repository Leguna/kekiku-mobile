import 'package:flutter/material.dart';

import '../../core/models/product_mdl.dart';
import 'product_card.dart';

class ListProductCardItem extends StatelessWidget {
  const ListProductCardItem({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          for (var i = 0; i < products.length; i++) ...[
            ProductCard(
              product: products[i],
            ),
            const SizedBox(width: 16),
          ]
        ],
      ),
    );
  }
}
