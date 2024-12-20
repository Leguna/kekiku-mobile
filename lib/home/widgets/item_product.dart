import 'package:kekiku/favorite/favorite_button.dart';

import '../../core/index.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    super.key,
    required this.product,
    this.imageSize = 120,
    this.showFavorite = true,
  });

  final Product product;
  final double imageSize;
  final bool showFavorite;

  @override
  Widget build(BuildContext context) {
    final bool isDiscounted = product.discount != 0;
    final bool isLowStock = (product.stock) < 10;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.productDetail,
              arguments: product.toJson(),
            );
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  fit: StackFit.passthrough,
                  children: [
                    MyImageLoader(
                      path: product.image,
                      width: imageSize,
                      height: imageSize,
                    ),
                    if (product.stock == 0)
                      Container(
                        width: imageSize,
                        height: imageSize,
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: SizedBox(),
                        ),
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            if (product.stock == 0) ...[
                              _buildImageLabel(
                                Strings.outOfStock,
                                backgroundColor: Colors.grey,
                              ),
                              const SizedBox(height: 4),
                            ],
                            if (isLowStock && product.stock > 0) ...[
                              _buildImageLabel('${product.stock} left',
                                  backgroundColor: Colors.blueGrey),
                              const SizedBox(height: 4),
                            ],
                            if (product.label != null) ...[
                              _buildImageLabel(
                                product.label!,
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(height: 4),
                            ],
                            if (product.discount != 0) ...[
                              _buildImageLabel(
                                  "${product.discount.toStringAsFixed(0)}%"),
                              const SizedBox(height: 4),
                            ],
                          ],
                        ),
                        const Expanded(
                          child: SizedBox(height: 8),
                        ),
                        if (showFavorite) ...[
                          Column(
                            children: [
                              FavoriteButton(product: product),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  product.name ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if ((product.discount) > 0) ...[
                  Text(
                    '\$${product.discountedPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
                Text(
                  '\$${product.price?.toStringAsFixed(2)}',
                  style: !isDiscounted
                      ? Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          )
                      : Theme.of(context).textTheme.labelSmall?.copyWith(
                            decoration: product.discount != 0
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                ),
                if (product.rating != null) ...[
                  _buildRating(context),
                ],
                if (product.address != null) ...[
                  _buildLocation(context),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildImageLabel(
    String text, {
    Color backgroundColor = Colors.redAccent,
  }) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }

  Row _buildRating(BuildContext context) {
    return Row(
      children: [
        const Icon(
          color: Colors.orange,
          Icons.star,
          size: 16,
        ),
        const SizedBox(width: 2),
        Text(
          "${product.rating?.toStringAsFixed(1)}",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        if (product.sold != 0) ...[
          Text(
            " · ${product.sold} sold",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ],
    );
  }

  Row _buildLocation(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          size: 16,
        ),
        Text(
          product.address ?? '',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
