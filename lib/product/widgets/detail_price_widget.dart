import '../../core/index.dart';

class DetailPriceWidget extends StatelessWidget {
  const DetailPriceWidget({
    super.key,
    required this.price,
    required this.discount,
  });

  final double price;
  final double discount;

  @override
  Widget build(BuildContext context) {
    final discountedPrice = price - (price * (discount / 100));
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
                  if (discount > 0) ...[
                    const SizedBox(width: Dimens.small),
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 1.5,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(125),
                          ),
                    ),
                    const SizedBox(width: Dimens.small),
                    Text(
                      "${discount.toStringAsFixed(0)}%",
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
}
