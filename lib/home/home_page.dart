import 'package:kekiku/cart/bloc/cart_cubit.dart';
import 'package:kekiku/product/bloc/product_cubit.dart';

import '../core/index.dart';
import 'blocs/home_cubit.dart';
import 'widgets/fake_search_bar.dart';
import 'widgets/home_image_swiper.dart';
import 'widgets/home_list_horizontal_product.dart';
import 'widgets/list_infinite_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    final productCubit = ProductCubit();
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
          BlocSelector<CartCubit, CartState, int>(
            bloc: context.read<CartCubit>(),
            selector: (state) => switch (state) {
              CartLoaded(:final totalQuantity) => totalQuantity,
              _ => 0,
            },
            builder: (context, cartCount) {
              return IconButtonBadged(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cart);
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                badgeText: cartCount > 0 ? cartCount.toString() : '',
              );
            },
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
                    // const SizedBox(height: Dimens.small),
                    // const HomeChip(),
                    // const SizedBox(height: Dimens.small),
                    // const HomeBadgedIconList(),
                    // const SizedBox(height: Dimens.small),
                    const HomeListHorizontalProduct(),
                    const SizedBox(height: Dimens.medium),
                  ],
                ),
              ),
            ];
          },
          body: BlocBuilder<ProductCubit, ProductState>(
            bloc: productCubit,
            builder: (context, state) {
              return ListInfiniteProduct(
                state: productCubit.pagingState,
                onNextPage: () {
                  productCubit.getProducts();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
