import '../../core/index.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(this.transaction, {super.key});

  final Transaction? transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color?.withOpacity(0.2),
      margin: const EdgeInsets.all(Dimens.small),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction?.status ?? '',
                ),
              ],
            ),
            Text(
              transaction?.products?[0].name ?? '',
            ),
            Text(
              transaction?.date ?? '',
            ),
            const Divider(thickness: Dimens.micro),
            const SizedBox(height: Dimens.small),
            Text(
              transaction?.description ?? '',
            ),
            const SizedBox(height: Dimens.small),
            Text(
              transaction?.amount.toString() ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
