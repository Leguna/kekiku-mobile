import '../../core/index.dart';
import '../blocs/transaction_cubit.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(this.transaction, {super.key});

  final Transaction? transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.large,
        vertical: Dimens.small,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.medium),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: Dimens.nano,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(transaction?.getTypeIconData()),
                const SizedBox(width: Dimens.medium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction?.getType() ?? ''),
                      Text(
                        transaction?.date.toFormattedDate() ?? '',
                        style: TextStyle(
                          fontSize: Dimens.medium,
                          color: Theme.of(context).textTheme.labelSmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(Dimens.small),
                  decoration: BoxDecoration(
                    color: transaction?.getStatusColor() ?? Colors.grey,
                    borderRadius: BorderRadius.circular(Dimens.tiny),
                  ),
                  child: Text(
                    transaction?.getStatus() ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: Dimens.medium,
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.tiny),
                if (transaction?.status == TransactionStatus.processing) ...[
                  BlocBuilder<TransactionCubit, TransactionState>(
                    builder: (context, state) {
                      switch (state) {
                        case TransactionLoading(:final transactionId):
                          if (transactionId == transaction?.id) {
                            return SizedBox();
                          }
                        default:
                          break;
                      }
                      return IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          showMyModalBottomSheet(
                            context,
                            title: "Options",
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.fact_check),
                                  title: const Text(Strings.finishOrder),
                                  onTap: () {
                                    // Handle details action
                                    context
                                        .read<TransactionCubit>()
                                        .finishTransaction(
                                          transaction?.id ?? '',
                                        );
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.delete),
                                  title: const Text(Strings.cancel),
                                  onTap: () {
                                    // Handle delete action
                                    context
                                        .read<TransactionCubit>()
                                        .cancelTransaction(
                                          transaction?.id ?? '',
                                        );
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        visualDensity: VisualDensity.compact,
                      );
                    },
                  ),
                ],
              ],
            ),
            const Divider(thickness: Dimens.micro, height: Dimens.medium),
            const SizedBox(height: Dimens.small),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyImageLoader(
                  path: transaction?.products[0].image ?? '',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: Dimens.medium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction?.products[0].productName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        transaction?.products[0].variantName ?? '',
                        style: TextStyle(
                          fontSize: Dimens.medium,
                          color: Theme.of(context).textTheme.labelSmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if ((transaction?.products.length ?? 0) > 1) ...[
              const SizedBox(height: Dimens.medium),
              Text(
                '+${transaction!.products.length - 1} more products',
                style: TextStyle(
                  fontSize: Dimens.medium,
                  color: Theme.of(context).textTheme.labelSmall?.color,
                ),
              ),
            ],
            const SizedBox(height: Dimens.medium),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.totalPrice,
                      style: TextStyle(
                        fontSize: Dimens.medium,
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
                BlocBuilder<TransactionCubit, TransactionState>(
                  builder: (context, state) {
                    switch (state) {
                      case TransactionLoading(:final transactionId):
                        if (transactionId == transaction?.id) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.medium,
                                vertical: Dimens.small,
                              ),
                              visualDensity: VisualDensity.compact,
                              shadowColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              elevation: Dimens.tiny,
                            ),
                            onPressed: () {},
                            child: SizedBox(
                              width: Dimens.medium,
                              height: Dimens.medium,
                              child: CircularProgressIndicator(
                                strokeWidth: Dimens.micro,
                              ),
                            ),
                          );
                        }
                    }
                    if (transaction?.status == TransactionStatus.cancelled) {
                      return SizedBox();
                    }

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.medium,
                          vertical: Dimens.small,
                        ),
                        visualDensity: VisualDensity.compact,
                        shadowColor: Theme.of(context).colorScheme.onPrimary,
                        elevation: Dimens.tiny,
                      ),
                      onPressed: () {
                        final cubit = context.read<TransactionCubit>();
                        switch (transaction?.status) {
                          case TransactionStatus.completed:
                            cubit
                                .buyAgainFromTransaction(transaction?.id ?? '');
                            break;
                          case TransactionStatus.processing:
                            cubit.finishTransaction(transaction?.id ?? '');
                            break;
                          case TransactionStatus.cancelled:
                          default:
                            break;
                        }
                      },
                      child: Text(
                        transaction?.status == TransactionStatus.completed
                            ? Strings.buyAgain
                            : Strings.finishOrder,
                        style: TextStyle(fontSize: Dimens.medium),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
