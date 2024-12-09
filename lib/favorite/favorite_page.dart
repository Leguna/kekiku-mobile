import 'package:kekiku/core/index.dart';
import 'package:kekiku/home/widgets/list_infinite_product.dart';

import 'bloc/favorite_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.read<FavoriteCubit>();
    favoriteCubit.getFavorites();
    return RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 1;
      },
      onRefresh: () async {
        await favoriteCubit.getFavorites();
      },
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text(Strings.favorite),
              floating: true,
              snap: true,
              pinned: true,
            ),
          ];
        },
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return ListInfiniteProduct(
              showFavorite: false,
              pagingController: context.read<FavoriteCubit>().pagingController,
              products: favoriteCubit.pagingController.itemList ?? [],
            );
          },
        ),
      ),
    );
  }
}
