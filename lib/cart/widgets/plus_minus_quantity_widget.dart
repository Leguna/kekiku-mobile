import '../../core/index.dart';
import '../bloc/cart_cubit.dart';
import '../models/cart_item_mdl.dart';

class PlusMinusQuantityWidget extends StatelessWidget {
  const PlusMinusQuantityWidget({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(Dimens.medium),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                context
                    .read<CartCubit>()
                    .decrementProductQuantity(cartItem.variantId);
              }),
          Text(cartItem.quantity.toString()),
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context
                    .read<CartCubit>()
                    .incrementProductQuantity(cartItem.variantId);
              }),
        ],
      ),
    );
  }
}
