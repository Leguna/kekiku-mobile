import '../../core/index.dart';
import '../bloc/cart_cubit.dart';
import '../models/cart_item_mdl.dart';
import 'plus_minus_quantity_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.large,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          MyImageLoader(
            path: cartItem.image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(width: Dimens.medium),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem.productName),
                          if (cartItem.productName != cartItem.variantName) ...[
                            const SizedBox(height: Dimens.nano),
                            Text(
                              cartItem.variantName,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ],
                      )),
                      const SizedBox(width: Dimens.medium),
                      IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<CartCubit>()
                              .removeProduct(cartItem.variantId);
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Total: ',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  cartItem.totalPrice.toCurrency(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                if (cartItem.discountValue > 0) ...[
                                  const SizedBox(width: Dimens.tiny),
                                  Text(
                                    cartItem.totalBasePrice.toCurrency(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        )),
                        PlusMinusQuantityWidget(cartItem: cartItem),
                      ],
                    ),
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
