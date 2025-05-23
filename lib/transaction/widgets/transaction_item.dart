import '../../core/index.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(this.transaction, {super.key});

  final Transaction? transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color?.withAlpha(50),
      margin: const EdgeInsets.all(Dimens.tiny),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(transaction?.getTypeIconData()),
                const SizedBox(width: Dimens.small),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction?.getType() ?? ''),
                    Text(
                      transaction?.date?.toFormattedDate() ?? '',
                      style: TextStyle(
                        fontSize: Dimens.small,
                        color: Theme.of(context).textTheme.labelSmall?.color,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Container(
                  padding: const EdgeInsets.all(Dimens.tiny),
                  decoration: BoxDecoration(
                    color: transaction?.getStatusColor(),
                    borderRadius: BorderRadius.circular(Dimens.small),
                  ),
                  child: Text(
                    transaction?.getStatus() ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: Dimens.small,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: Dimens.micro, height: Dimens.small),
            const SizedBox(height: Dimens.tiny),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyImageLoader(
                  path: transaction?.products[0].image ?? '',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: Dimens.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction?.products[0].productName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Description
                      Text(
                        transaction?.description ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if ((transaction?.products.length ?? 0) > 1) ...[
              const SizedBox(height: Dimens.small),
              Text(
                '+${transaction!.products.length - 1} more products',
                style: TextStyle(
                  fontSize: Dimens.small,
                  color: Theme.of(context).textTheme.labelSmall?.color,
                ),
              ),
            ],
            const SizedBox(height: Dimens.small),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.totalPrice,
                      style: TextStyle(
                        fontSize: Dimens.small,
                        color: Theme.of(context).textTheme.labelSmall?.color,
                      ),
                    ),
                    Text(
                      transaction?.getPrice() ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.small,
                      vertical: Dimens.tiny,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  onPressed: () {},
                  child: const Text(
                    Strings.buyAgain,
                    style: TextStyle(fontSize: Dimens.small),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
