import '../core/index.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: MyAppBar(
          title: Text(Strings.checkout),
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: "Step 1"),
                  Tab(text: "Step 2"),
                  Tab(text: "Step 3"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const Placeholder(
                      color: Colors.red,
                      child: Center(
                        child: Text('Checkout Step 1'),
                      ),
                    ),
                    const Placeholder(
                      color: Colors.green,
                      child: Center(
                        child: Text('Checkout Step 2'),
                      ),
                    ),
                    const Placeholder(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Checkout Step 3'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
