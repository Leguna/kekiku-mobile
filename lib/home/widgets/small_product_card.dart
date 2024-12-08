import 'package:kekiku/core/index.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.size = 120,
  });

  final Product product;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyImageLoader(
            path: product.image,
            width: size,
            height: size,
            radius: 8,
            onImageLoaded: () {},
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                product.name ?? '',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
              ),
              Text(
                '\$ ${product.price?.toStringAsFixed(2)}',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
