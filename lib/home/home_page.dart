import '../core/index.dart';
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
    return MyScaffold(
      appBar: AppBar(
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
      body: RefreshIndicator(
        onRefresh: () async {
          await Future<void>.delayed(const Duration(seconds: 1));
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
          body: ListInfiniteProduct(products: products),
        ),
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
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const Product(
    name: 'Pudding Raisin',
    price: 10,
    tag: 'New',
    categories: ['Pudding'],
    description:
        'Pudding is a type of food that can be either a dessert or a savory dish that is part of the main meal.',
    image:
        'https://images.unsplash.com/photo-1552637086-ce3bf3275c4c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];
