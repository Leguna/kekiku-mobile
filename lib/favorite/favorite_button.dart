import 'package:kekiku/favorite/bloc/favorite_cubit.dart';

import '../core/index.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().isFavorite(widget.product.id).then((value) {
      setState(() {
        isFavorite = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
            context
                .read<FavoriteCubit>()
                .setFavorite(widget.product, !isFavorite);
          },
          child: Container(
            padding: const EdgeInsets.all(Dimens.small),
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimens.small),
              ),
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
          ),
        );
      },
    );
  }
}
