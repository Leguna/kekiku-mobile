import '../core/index.dart';
import '../home/widgets/fake_search_bar.dart';
import 'widgets/filter_bar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: const FakeSearchBar(),
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
          IconButtonBadged(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButtonBadged(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Transaction $index'),
            subtitle: Text('Transaction $index description'),
          );
        },
      ),
    );
  }
}
