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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
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
          ],
        ),
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
          products: [],
        ),
      ],
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
