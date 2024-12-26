import 'package:kekiku/product/bloc/product_cubit.dart';

import '../core/index.dart';
import 'blocs/home_cubit.dart';
import 'widgets/fake_search_bar.dart';
import 'widgets/home_badged_icon_list.dart';
import 'widgets/home_chip.dart';
import 'widgets/home_image_swiper.dart';
import 'widgets/home_list_horizontal_product.dart';
import 'widgets/list_infinite_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    final productCubit = ProductCubit();
    productCubit.getProducts();
    return MyScaffold(
      appBar: AppBar(
        title: FakeSearchBar(
          onTap: () {
            Navigator.pushNamed(context, Routes.search);
          },
        ),
        leading: const SizedBox(width: 16),
        leadingWidth: 16,
        titleSpacing: 0,
        actions: [
          IconButtonBadged(
            onPressed: () {
              Navigator.pushNamed(context, Routes.notification);
            },
            icon: const Icon(Icons.notifications_none),
          ),
          IconButtonBadged(
            onPressed: () {
              Navigator.pushNamed(context, Routes.cart);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: RefreshIndicator(
        notificationPredicate: (ScrollNotification notification) {
          return notification.depth == 1;
        },
        onRefresh: () async {
          await homeCubit.refreshHome();
          await productCubit.refresh();
        },
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Divider(height: 1, thickness: 1),
                    const HomeImageSwiper(),
                    const SizedBox(height: Dimens.small),
                    const HomeChip(),
                    const SizedBox(height: Dimens.small),
                    const HomeBadgedIconList(),
                    const SizedBox(height: Dimens.small),
                    const HomeListHorizontalProduct(),
                    const SizedBox(height: Dimens.small),
                  ],
                ),
              ),
            ];
          },
          body: BlocBuilder<ProductCubit, ProductState>(
            bloc: productCubit,
            builder: (context, state) {
              return ListInfiniteProduct(
                products: productCubit.products,
                pagingController: productCubit.pagingController,
              );
            },
          ),
        ),
      ),
    );
  }
}
