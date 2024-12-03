import 'package:flutter/material.dart';

import '../../core/models/product_mdl.dart';
import 'product_card.dart';

class ListProductCardItem extends StatelessWidget {
  const ListProductCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    if (products.isNotEmpty) products = products;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          for (var i = 0; i < products.length; i++) ...[
            ProductCard(product: products[i]),
            const SizedBox(width: 16),
          ]
        ],
      ),
    );
  }
}

List<Product> products = [
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image: 'https://picsum.photos/seed/pudding3/100',
  ),
  const Product(
    name: 'Bread',
    categories: ['Bread'],
    price: 5,
    description:
        'Bread is a staple food prepared from a dough of flour and water, usually by baking.',
    image: 'https://picsum.photos/seed/bread2/100',
  ),
  const Product(
    name: 'Doughnut',
    categories: ['Doughnut'],
    price: 3,
    description:
        'A doughnut or donut is a type of fried dough confection or dessert food.',
    image: 'https://picsum.photos/seed/doughnut1/100',
  ),
  const Product(
    name: 'Biscuit',
    categories: ['Biscuit'],
    price: 2,
    description:
        'Biscuit is a term used for a variety of primarily flour-based baked food products.',
    image: 'https://picsum.photos/seed/biscuit2/100',
  ),
];
