import 'package:kekiku/cart/bloc/cart_cubit.dart';
import 'package:kekiku/core/widgets/my_shimmer.dart';

import '../../core/index.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) {
        if (current is CartLoading && previous is CartEmpty) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        switch (state) {
          case CartEmpty():
            return const SizedBox();
          case CartLoading():
          case CartLoaded():
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.small),
                  topRight: Radius.circular(Dimens.small),
                ),
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: Dimens.borderWidth,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(Dimens.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      Strings.orderSummary,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    // Promo Field
                    const SizedBox(height: Dimens.medium),
                    const OrderSummaryWidget(),
                    SizedBox(height: Dimens.medium),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().checkout();
                      },
                      child: Text('Checkout'),
                    ),
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        switch (state) {
          case CartLoaded(
              :final totalPrice,
              :final totalQuantity,
              :final totalDiscountedPrice,
              :final deliveryFee
            ):
            return Column(
              children: [
                LabelPrice(Strings.totalQuantity,
                    value: totalQuantity.toString()),
                LabelPrice(
                  Strings.discountedPrice,
                  value: totalDiscountedPrice.toCurrency(),
                ),
                LabelPrice(
                  Strings.deliveryFee,
                  value: deliveryFee.toCurrency(),
                ),
                MyDivider(),
                LabelPrice(
                  Strings.totalPrice,
                  value: totalPrice.toCurrency(),
                ),
              ],
            );
          default:
            return Column(
              children: [
                for (int i = 0; i < 3; i++) ...[
                  const SizedBox(height: Dimens.tiny),
                  const MyShimmer(),
                ],
              ],
            );
        }
      },
    );
  }
}

class LabelPrice extends StatelessWidget {
  const LabelPrice(
    this.label, {
    super.key,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }
}
