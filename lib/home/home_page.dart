import 'package:kekiku/home/widgets/home_image_swiper.dart';
import 'package:kekiku/home/widgets/horizontal_list_product_card.dart';

import '../core/index.dart';
import 'widgets/fake_search_bar.dart';
import 'widgets/home_badged_icon_list.dart';
import 'widgets/home_chip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future<void>.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(minHeight: 1000),
          child: Column(
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
              const Divider(height: 1, thickness: 1),
              const HomeImageSwiper(),
              const SizedBox(height: Dimens.small),
              const HomeChip(),
              const SizedBox(height: Dimens.small),
              const HomeBadgedIconList(),
              const SizedBox(height: Dimens.small),
              const ListProductCardItem(),
              const SizedBox(height: Dimens.small),
            ],
          ),
        ),
      ),
    );
  }
}
