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
    product = Product.fromJson(widget.args ?? {});
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
    return MyScaffold(
      appBar: DetailAppBar(product),
      body: Stack(
        children: [
          ListView(
            controller: mainController,
            children: [
              Column(
                children: [
                  MediaViewPagerList(
                    key: mediaDisplay,
                    onPageChanged: (index) {
                      buttonVariants.currentState?.selectedVariant(index);
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
                  ButtonVariants(
                    key: buttonVariants,
                    onTap: (index) {
                      mediaDisplay.currentState?.changePage(index);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name ?? "",
                        ),
                        Text(
                          product.price.toString(),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    key: descriptionKey,
                    Strings.description,
                  ),
                  Image.network(
                    product.image ?? "",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.width,
                  ),
                  Text(
                    key: reviewKey,
                    Strings.reviews,
                  ),
                  Image.network(
                    product.image ?? "",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.width,
                  ),
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
              length: 2,
              child: TabBar(
                onTap: (index) {
                  try {
                    if (index == 0) {
                      mainController.animateTo(
                        scrollToKey(descriptionKey),
                        duration: Duration(milliseconds: animSpeed),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      mainController.animateTo(
                        scrollToKey(reviewKey),
                        duration: Duration(milliseconds: animSpeed),
                        curve: Curves.easeInOut,
                      );
                    }
                  } catch (e) {
                    // ignore: avoid_print
                  }
                },
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: Strings.description),
                  Tab(text: Strings.reviews),
                ],
              ),
            ),
          ),
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
