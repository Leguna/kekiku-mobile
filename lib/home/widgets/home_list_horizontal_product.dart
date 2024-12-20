import 'package:flutter/material.dart';

import '../../core/models/product_mdl.dart';
import 'small_product_card.dart';

class HomeListHorizontalProduct extends StatelessWidget {
  const HomeListHorizontalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      const Product(
        name: 'Pudding Raisin',
        price: 10,
        label: 'New',
        categories: ['Pudding'],
        description:
            'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
        image:
            'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      const Product(
        name: 'Bread',
        categories: ['Bread'],
        price: 5,
        description:
            'Bread is a staple food prepared from a dough of flour and water, usually by baking.',
        image:
            'https://images.unsplash.com/photo-1509440159596-0249088772ff?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      const Product(
        name: 'Doughnut',
        categories: ['Doughnut'],
        price: 3,
        description:
            'A doughnut or donut is a type of fried dough confection or dessert food.',
        image:
            'https://images.unsplash.com/photo-1533910534207-90f31029a78e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      const Product(
        name: 'Biscuit',
        categories: ['Biscuit'],
        price: 2,
        description:
            'Biscuit is a term used for a variety of primarily flour-based baked food products.',
        image:
            'https://plus.unsplash.com/premium_photo-1671379521839-a414c1e20e97?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ];
    if (products.isNotEmpty) products = products;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
              for (var i = 0; i < products.length; i++) ...[
                ProductCard(product: products[i]),
                const SizedBox(width: 16),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
