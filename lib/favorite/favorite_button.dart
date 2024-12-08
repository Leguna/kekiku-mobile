import '../core/index.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    this.onTap,
    this.initialIsFavorite = false,
  });

  final void Function(bool isFavorite)? onTap;
  final bool initialIsFavorite;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.initialIsFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        widget.onTap?.call(isFavorite);
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
  }
}
