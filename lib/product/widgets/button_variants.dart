import 'package:kekiku/core/index.dart';

class ButtonVariants extends StatefulWidget {
  const ButtonVariants({
    super.key,
    this.onTap,
    required this.variants,
  });

  final Function(int index)? onTap;
  final List<Variant> variants;

  @override
  State<ButtonVariants> createState() => ButtonVariantsState();
}

class ButtonVariantsState extends State<ButtonVariants> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColorDark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: Dimens.medium),
          for (var i = 0; i < widget.variants.length; i++) ...[
            ElevatedButton(
              onPressed: () {
                widget.onTap?.call(i);
                selectedVariant(i);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    indexSelected == i ? selectedColor : Colors.transparent,
                textStyle: TextStyle(
                  color: indexSelected == i ? Colors.white : Colors.black,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              child: Row(
                children: [
                  if (widget.variants[i].image != null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimens.small,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.variants[i].image!,
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimens.small),
                  ],
                  Text(widget.variants[i].name ?? ""),
                ],
              ),
            ),
            const SizedBox(width: Dimens.medium),
          ],
        ],
      ),
    );
  }

  void selectedVariant(int index) {
    setState(() {
      indexSelected = index;
    });
  }
}
