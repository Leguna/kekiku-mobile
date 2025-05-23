import 'package:kekiku/cart/bloc/cart_cubit.dart';
import 'package:kekiku/cart/models/cart_item_mdl.dart';
import 'package:lottie/lottie.dart';

import '../core/index.dart';
import 'widgets/cart_bottom_sheet_widget.dart';
import 'widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyScaffold(
          appBar: const MyAppBar(title: Text('Cart')),
          bottomSheet: CartBottomSheetWidget(),
          body: BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) {
              if (current is CartLoading) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              final cartItems = switch (state) {
                CartLoaded(products: final products) => products,
                _ => <CartItem>[]
              };
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<CartCubit>().getCart();
                },
                child: cartItems.isNotEmpty
                    ? ListView.separated(
                  padding: const EdgeInsets.only(
                    top: Dimens.medium,
                    bottom: Dimens.spaceBig,
                  ),
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: cartItems.length + 1,
                  separatorBuilder: (context, index) =>
                      MyDivider(
                        thickness: Dimens.nano,
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == cartItems.length) {
                      return SizedBox(height: 100);
                    }

                    final cartItem = cartItems[index];
                    return CartItemWidget(cartItem: cartItem);
                  },
                )
                    : EmptyListWidget(),
              );
            },
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            bool isLoadingFull = switch (state) {
              CartLoading(:final isFull) => isFull,
              _ => false,
            };
            return isLoadingFull ? MyLoading() : SizedBox();
          },
        ),
      ],
    );
  }
}

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        minHeight:
        MediaQuery
            .of(context)
            .size
            .height * 0.8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Assets.lotties.notfound),
          const Text(Strings.cartEmpty),
        ],
      ),
    ),
                      ),
                    );
  }
}
