import 'package:flutter/material.dart';
import 'package:kekiku/core/widgets/icon_button_badged.dart';

import '../core/index.dart';
import 'widgets/fake_search_bar.dart';
import 'widgets/horizontal_list_product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'All',
      'Pudding',
      'Bread',
      'Doughnut',
      'Biscuit',
      'Pie',
    ];
    return MyScaffold(
      appBar: AppBar(
        title: const FakeSearchBar(),
        toolbarHeight: 80,
        leading: const SizedBox(width: 16),
        leadingWidth: 16,
        titleSpacing: 0,
        actions: [
          IconButtonBadged(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButtonBadged(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.menu);
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              Strings.homeTitle,
              style: AppTextStyles.titleHome,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 16),
                for (var i = 0; i < categories.length; i++) ...[
                  _buildCategory(i, categories),
                  const SizedBox(width: 4),
                ],
                const SizedBox(width: 12),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ListProductCardItem(
            products: [
              Product(
                name: 'Pudding Raisin',
                price: 10,
                tag: 'New',
                categories: ['Pudding'],
                description:
                    'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
                image: 'https://picsum.photos/seed/pudding3/100',
              ),
              Product(
                name: 'Bread',
                categories: ['Bread'],
                price: 5,
                description:
                    'Bread is a staple food prepared from a dough of flour and water, usually by baking.',
                image: 'https://picsum.photos/seed/bread2/100',
              ),
              Product(
                name: 'Doughnut',
                categories: ['Doughnut'],
                price: 3,
                description:
                    'A doughnut or donut is a type of fried dough confection or dessert food.',
                image: 'https://picsum.photos/seed/doughnut1/100',
              ),
              Product(
                name: 'Biscuit',
                categories: ['Biscuit'],
                price: 2,
                description:
                    'Biscuit is a term used for a variety of primarily flour-based baked food products.',
                image: 'https://picsum.photos/seed/biscuit2/100',
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildCategory(index, categories) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(64),
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.charcoalBlue,
              borderRadius: BorderRadius.circular(64),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Center(
              child: Text(categories[index]),
            ),
          ),
        ),
      ],
    );
  }
}
