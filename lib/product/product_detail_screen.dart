import 'package:kekiku/product/bloc/product_cubit.dart';
import 'package:kekiku/product/widgets/button_variants.dart';
import 'package:kekiku/product/widgets/detail_name_widget.dart';
import 'package:kekiku/product/widgets/detail_price_widget.dart';
import 'package:kekiku/product/widgets/detail_summary_widget.dart';

import '../cart/bloc/cart_cubit.dart';
import '../core/index.dart';
import 'widgets/detail_app_bar.dart';
import 'widgets/media_view_pager_list.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, this.args = const {}});

  final Map<String, dynamic>? args;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final GlobalKey descriptionKey = GlobalKey();
  final GlobalKey reviewKey = GlobalKey();
  final GlobalKey tabBar = GlobalKey();
  final GlobalKey<MediaViewPagerListState> mediaDisplay = GlobalKey();
  final GlobalKey<ButtonVariantsState> buttonVariants = GlobalKey();
  Product product = const Product();

  late ScrollController mainController;
  final int animSpeed = 100;

  bool showTab = false;

  @override
  void initState() {
    super.initState();
    product = context.read<ProductCubit>().selectedProduct ?? product;
    mainController = ScrollController();
    mainController.addListener(() {
      final offset = mainController.offset;
      final mediaDisplaySize = getWidgetSize(mediaDisplay).height;
      if (offset > mediaDisplaySize - 50) {
        if (!showTab) {
          setState(() {
            showTab = true;
          });
        }
      } else {
        if (showTab) {
          setState(() {
            showTab = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();
        final variantId = cubit.selectedVariant?.id ?? "";
        return MyScaffold(
          appBar: DetailAppBar(product),
          body: Stack(
            children: [
              ListView(
                controller: mainController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediaViewPagerList(
                        key: mediaDisplay,
                        onPageChanged: (index) {
                          final decrement = product.video != null ? 2 : 1;
                          final indexVariant = (index - decrement);
                          final variantId = product.variants[indexVariant].id;
                          final clampIndex =
                              indexVariant < 0 ? 0 : indexVariant;
                          cubit.selectVariant(product.variants[clampIndex]);
                          buttonVariants.currentState
                              ?.selectedVariant(clampIndex);
                          context.read<CartCubit>().changeSelectedVariant(variantId);
                        },
                        files: [
                          if (product.video != null)
                            FileNetworkAsset(
                              path: product.video ?? "",
                              type: AssetType.video,
                            ),
                          FileNetworkAsset(
                            path: product.image ?? "",
                            type: AssetType.image,
                          ),
                          for (final variant in product.variants) ...[
                            if (variant.image != null)
                              FileNetworkAsset(
                                type: AssetType.image,
                                path: variant.image ?? "",
                              ),
                          ]
                        ],
                      ),
                      DetailNameWidget(name: product.name),
                      DetailSummaryWidget(product: product),
                      const Divider(height: 32, thickness: 2),
                      ButtonVariants(
                        key: buttonVariants,
                        variants: product.variants,
                        onTap: (index) {
                          final indexVariant =
                              index + (product.video != null ? 2 : 1);
                          cubit.selectVariant(product.variants[index]);
                          mediaDisplay.currentState?.changePage(indexVariant);
                        },
                      ),
                      DetailPriceWidget(
                          price: cubit.selectedVariant?.price ?? 0,
                          discount: product.discount),
                      const Divider(height: 8, thickness: 8),
                      const SizedBox(height: Dimens.medium),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.medium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              key: descriptionKey,
                              Strings.description,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: Dimens.small),
                            Text(
                              product.description ?? "",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimens.medium),
                      const Divider(thickness: 8),
                      const SizedBox(height: Dimens.medium),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.medium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              key: reviewKey,
                              Strings.reviews,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: Dimens.small),
                            if (product.reviews.isEmpty) ...[
                              Text(
                                Strings.noReviews,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                            for (final review in product.reviews) ...[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${review.name} - ${review.rating}",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const SizedBox(height: Dimens.micro),
                                  Text(
                                    "${review.comment}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: Dimens.medium),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 500),
                    ],
                  ),
                ],
              ),
              AnimatedContainer(
                height: showTab ? 50 : 0,
                duration: Duration(milliseconds: animSpeed),
                key: tabBar,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    onTap: (index) {
                      try {
                        switch (index) {
                          case 0:
                            mainController.animateTo(
                              0,
                              duration: Duration(milliseconds: animSpeed),
                              curve: Curves.easeInOut,
                            );
                            break;
                          case 1:
                            mainController.animateTo(
                              scrollToKey(descriptionKey),
                              duration: Duration(milliseconds: animSpeed),
                              curve: Curves.easeInOut,
                            );
                            break;
                          case 2:
                            mainController.animateTo(
                              scrollToKey(reviewKey),
                              duration: Duration(milliseconds: animSpeed),
                              curve: Curves.easeInOut,
                            );
                            break;
                        }
                      } catch (e) {
                        // ignore: avoid_print
                      }
                    },
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: Strings.top),
                      Tab(text: Strings.description),
                      Tab(text: Strings.reviews),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 84,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: animSpeed * 2),
                  opacity: showTab ? 1 : 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(Dimens.large),
                    ),
                    child: IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.arrow_upward, size: Dimens.medium),
                      onPressed: () {
                        mainController.animateTo(
                          0,
                          duration: Duration(milliseconds: animSpeed),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(Dimens.small),
                  width: Dimens.screenWidth,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: const Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: Dimens.medium,
                    children: [
                      if (cubit.selectedProduct?.stock == 0) ...[
                        Expanded(
                          child: OutlinedButton(
                            onPressed: null,
                            child: Text(
                              Strings.outOfStock,
                              style: AppTextStyles.medium,
                            ),
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .incrementProductQuantity(variantId);
                              Navigator.pushNamed(context, Routes.cart);
                            },
                            child: Text(
                              Strings.buyNow,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        BlocSelector<CartCubit, CartState, int>(
                          selector: (state) => switch (state) {
                            CartLoaded(:final selectedQuantity) =>
                              selectedQuantity,
                            CartLoading() => -1,
                            _ => 0,
                          },
                          builder: (context, quantity) {
                            if (quantity == -1) {
                              return const Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            if (quantity == 0) {
                              return Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<CartCubit>()
                                        .incrementProductQuantity(variantId);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.shopping_cart),
                                      Text(Strings.addToCart),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Expanded(
                              child: Card(
                                color: Colors.transparent,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.small),
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<CartCubit>()
                                            .decrementProductQuantity(
                                                variantId);
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text(
                                      quantity.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<CartCubit>()
                                            .incrementProductQuantity(
                                                variantId);
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    mainController.dispose();
    super.dispose();
  }
}
