import '../../core/index.dart';
import '../bloc/cart_cubit.dart';

class PlusMinusQuantityWidget extends StatelessWidget {
  const PlusMinusQuantityWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(Dimens.small),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                context.read<CartCubit>().decrementProductQuantity(product);
              }),
          Text(
            product.quantity.toString(),
          ),
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<CartCubit>().incrementProductQuantity(product);
              }),
        ],
      ),
    );
  }
}