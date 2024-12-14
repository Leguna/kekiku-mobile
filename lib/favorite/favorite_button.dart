import 'package:kekiku/favorite/bloc/favorite_cubit.dart';

import '../core/index.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.product,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor = Colors.black38,
    this.borderRadius = const BorderRadius.only(bottomLeft: Radius.circular(8)),
  });

  final Product product;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color backgroundColor;

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
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            favoriteChanged: (id, isFavorite) {
              if (widget.product.id == id) {
                setState(() {
                  this.isFavorite = isFavorite;
                });
              }
            });
      },
      buildWhen: (previous, current) {
        return current.maybeWhen(
            orElse: () => false,
            favoriteChanged: (id, isFavorite) {
              return widget.product.id == id;
            });
      },
      builder: (context, state) {
        return InkWell(
          borderRadius: widget.borderRadius,
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
            context
                .read<FavoriteCubit>()
                .setFavorite(widget.product, !isFavorite);
          },
          child: Container(
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: widget.borderRadius,
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
