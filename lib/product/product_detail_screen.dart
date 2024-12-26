import 'package:kekiku/product/bloc/product_cubit.dart';
import 'package:kekiku/product/widgets/button_variants.dart';

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
  late Product product;

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
                          final clampIndex =
                              indexVariant < 0 ? 0 : indexVariant;
                          cubit.selectVariant(product.variants[clampIndex]);
                          buttonVariants.currentState
                              ?.selectedVariant(clampIndex);
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
                      _buildName(),
                      _buildSummary(),
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
                      _buildPrice(context, variant: cubit.selectedVariant),
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
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.cart);
                          },
                          child: Text(
                            Strings.buyNow,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.small),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.cart);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart),
                              Text(Strings.addToCart),
                            ],
                          ),
                        ),
                      ),
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

  Widget _buildPrice(BuildContext context, {Variant? variant}) {
    var price = variant?.price ?? product.price ?? 0;
    var discountedPrice = price - (price * product.discount / 100);

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.large, vertical: Dimens.small),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Row(
                children: [
                  Text(
                    "\$${discountedPrice.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (product.discount > 0) ...[
                    const SizedBox(width: Dimens.small),
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 1.5,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.5),
                          ),
                    ),
                    const SizedBox(width: Dimens.small),
                    Text(
                      "${product.discount.toStringAsFixed(0)}%",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.redAccent),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName({Variant? variant}) {
    final name = variant?.name ?? product.name;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: Dimens.small),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return SingleChildScrollView(
      child: Row(
        children: [
          const SizedBox(width: Dimens.medium),
          Container(
            padding: const EdgeInsets.all(Dimens.micro),
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(Dimens.small),
            ),
            child: Row(
              children: [
                const SizedBox(width: Dimens.micro),
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
                const SizedBox(width: Dimens.micro),
                Text(
                  "${Strings.sold} ${product.sold}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(width: Dimens.micro),
              ],
            ),
          ),
          const SizedBox(width: Dimens.small),
          Container(
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(Dimens.small),
            ),
            padding: const EdgeInsets.all(Dimens.micro),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SizedBox(width: Dimens.nano),
                Text(
                  product.rating.toString(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(width: Dimens.micro),
              ],
            ),
          ),
          const SizedBox(width: Dimens.small),
          Container(
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(Dimens.small),
            ),
            padding: const EdgeInsets.all(Dimens.micro),
            child: Row(
              children: [
                const SizedBox(width: Dimens.micro),
                const Icon(
                  Icons.comment,
                  color: Colors.blue,
                ),
                const SizedBox(width: Dimens.micro),
                Text(
                  "${product.reviews.length} ${Strings.reviews}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(width: Dimens.micro),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    mainController.dispose();
    super.dispose();
  }
}
