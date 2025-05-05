import 'package:kekiku/cart/bloc/cart_cubit.dart';
import 'package:lottie/lottie.dart';

import '../core/index.dart';
import 'widgets/cart_bottom_sheet_widget.dart';
import 'widgets/plus_minus_quantity_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: const MyAppBar(title: Text('Cart')),
      bottomSheet: CartBottomSheetWidget(),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final products = context.read<CartCubit>().products;
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<CartCubit>().getCart();
            },
            child: products.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.only(
                      top: Dimens.medium,
                      bottom: Dimens.spaceBig,
                    ),
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: products.length,
                    separatorBuilder: (context, index) => MyDivider(
                      thickness: Dimens.nano,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final product = products[index];
                      return _buildCard(context, product);
                    },
                  )
                : SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(Assets.lotties.notfound),
                          const Text('Cart is empty'),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  _buildCard(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.medium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          MyImageLoader(
            path: product.image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(width: Dimens.small),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(child: Text(product.name)),
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<CartCubit>().removeProduct(product);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total: ',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            product.totalPrice.toCurrency(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      )),
                      PlusMinusQuantityWidget(product: product),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
