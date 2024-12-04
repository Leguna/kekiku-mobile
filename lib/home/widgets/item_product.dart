import 'package:cached_network_image/cached_network_image.dart';

import '../../core/index.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    super.key,
    required this.product,
    this.imageSize = 120,
  });

  final Product product;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: product.image ?? '',
            imageBuilder: (context, imageProvider) => Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 8),
          Text(
            product.name ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '\$${product.price}',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          if (product.rating != null) ...[
            _buildRating(context),
          ],
          if (product.address != null) ...[
            _buildLocation(context),
          ],
        ],
      ),
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
        Text(
          "${product.rating?.toStringAsFixed(1)} · ${product.sold} sold",
          style: Theme.of(context).textTheme.labelMedium,
        ),
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
