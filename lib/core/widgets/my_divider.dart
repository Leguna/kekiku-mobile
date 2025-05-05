import 'package:flutter/material.dart';

import '../dimens.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    this.text = "",
    this.thickness = 2,
    this.padding = const EdgeInsets.symmetric(vertical: Dimens.small),
  });

  final String text;
  final double thickness;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: thickness,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          if (text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.tiny),
              child: Text(
                text,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          Expanded(
            child: Container(
              child: Divider(
                thickness: thickness,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
