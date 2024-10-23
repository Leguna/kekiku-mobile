import 'package:flutter/material.dart';

import '../dimens.dart';

class MyDivider extends StatelessWidget {
  const MyDivider(
    this.text, {
    super.key,
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
            child: Container(
              margin: const EdgeInsets.only(right: Dimens.small),
              child: Divider(
                thickness: thickness,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          if (text.isNotEmpty)
            Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: Dimens.small),
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
