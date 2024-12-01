import 'package:flutter/material.dart';
import 'package:kekiku/core/widgets/icon_button_badged.dart';
import 'package:kekiku/home/widgets/home_image_swiper.dart';

import '../core/index.dart';
import 'widgets/fake_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          title: const FakeSearchBar(),
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
        const Divider(height: 1,thickness: 1),
        const HomeImageSwiper(),
      ],
    );
  }

  SingleChildScrollView buildTagHorizontalList(List<String> categories) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: Dimens.small),
          for (var i = 0; i < categories.length; i++) ...[
            _buildCategory(i, categories),
            const SizedBox(width: 4),
          ],
          const SizedBox(width: Dimens.small),
        ],
      ),
    );
  }

  _buildCategory(index, categories) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.medium),
      child: Row(
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
      ),
    );
  }
}

List<String> categories = [
  'All',
  'Pudding',
  'Bread',
  'Doughnut',
  'Biscuit',
  'Pie',
];
