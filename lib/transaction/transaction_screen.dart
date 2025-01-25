import 'package:kekiku/transaction/blocs/transaction_cubit.dart';
import 'package:lottie/lottie.dart';

import '../core/index.dart';
import 'widgets/filter_bar.dart';
import 'widgets/transaction_item.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    final cubit = context.read<TransactionCubit>();
    cubit.initView();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TransactionCubit>();
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return MyScaffold(
          appBar: AppBar(
            title: TextField(
              controller: cubit.searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search transaction',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                suffixIcon: cubit.isQueryEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          cubit.clear();
                        },
                      ),
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: SizedBox(
                height: 48,
                child: FilterBar(),
              ),
            ),
            leading: const SizedBox(width: 16),
            leadingWidth: 16,
            titleSpacing: 0,
            actions: [
              const SizedBox(width: Dimens.tiny),
              IconButtonBadged(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notification);
                },
                icon: const Icon(Icons.notifications_none),
              ),
              IconButtonBadged(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cart);
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              const SizedBox(width: Dimens.tiny),
            ],
          ),
          body: RefreshIndicator(
            child: cubit.transactions.isEmpty
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Lottie.asset(
                          Assets.lotties.notfound,
                          reverse: true,
                        ),
                        Text(
                          Strings.noItemsFound,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: cubit.transactions.length,
                    itemBuilder: (context, index) {
                      return TransactionItem(cubit.transactions[index]);
                    },
                  ),
            onRefresh: () async {
              cubit.clear(tags: true);
              cubit.searchController.clear();
              cubit.fetchTransactions();
            },
          ),
        );
      },
    );
  }
}
