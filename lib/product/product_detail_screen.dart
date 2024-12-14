import 'package:kekiku/core/configs.dart';
import 'package:share_plus/share_plus.dart';

import '../core/index.dart';
import '../favorite/favorite_button.dart';
import 'widgets/image_view_pager_list.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, this.args = const {}});

  final Map<String, dynamic>? args;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final GlobalKey descriptionKey = GlobalKey();
  final GlobalKey reviewKey = GlobalKey();
  late Product product;
  late ScrollController mainController;
  late ScrollController tabController;
  final int scrollSpeed = 100;

  @override
  void initState() {
    super.initState();
    product = Product.fromJson(widget.args ?? {});
    mainController = ScrollController();
    tabController = ScrollController(initialScrollOffset: 0);
    mainController.addListener(_syncTabController);
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: MyAppBar(
        useDivider: false,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, Routes.search);
            },
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                  "${product.name} - ${product.price}\$ on ${Config.appName}");
            },
          ),
          FavoriteButton(
            product: product,
            borderRadius: BorderRadius.circular(Dimens.xlarge),
            backgroundColor: Colors.transparent,
          ),
          const IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.shopping_cart),
            onPressed: null,
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, Routes.menu);
            },
          ),
        ],
      ),
      body: NestedScrollView(
        controller: tabController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              floating: true,
              snap: true,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      onTap: (index) {
                        if (index == 0) {
                          _scrollToKey(descriptionKey);
                        } else if (index == 1) {
                          _scrollToKey(reviewKey);
                        }
                      },
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          text: Strings.description,
                        ),
                        Tab(
                          text: Strings.reviews,
                        ),
                      ],
                    ),
                  )),
            ),
          ];
        },
        body: ListView(
          controller: mainController,
          children: [
            Column(
              children: [
                ImageViewPagerList(
                  files: [
                    FileNetworkAsset(
                        path: product.image ?? "", type: AssetType.image),
                    FileNetworkAsset(
                        path: product.image ?? "", type: AssetType.image),
                    FileNetworkAsset(
                        path: product.image ?? "", type: AssetType.image),
                    FileNetworkAsset(
                        path: product.image ?? "", type: AssetType.image),
                  ],
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
      ),
    );
  }

  @override
  void dispose() {
    mainController.removeListener(_syncTabController);
    mainController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void _syncTabController() {
    if (mainController.hasClients && tabController.hasClients) {
      if (mainController.offset < 500) {
        tabController.animateTo(tabController.position.minScrollExtent,
            duration: Duration(milliseconds: scrollSpeed), curve: Curves.ease);
      } else {
        tabController.animateTo(tabController.position.maxScrollExtent,
            duration: Duration(milliseconds: scrollSpeed), curve: Curves.ease);
      }
    }
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: scrollSpeed),
        curve: Curves.easeInOut,
      );
    }
  }
}
