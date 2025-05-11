import '../../core/index.dart';

class DetailSummaryWidget extends StatelessWidget {
  const DetailSummaryWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
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
}
