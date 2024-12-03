import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../core/strings.dart';

class FakeSearchBar extends StatelessWidget {
  const FakeSearchBar({
    super.key,
    this.searchHint,
    this.onTap,
  });

  final List<String>? searchHint;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var searchHint = this.searchHint ?? Strings.searchHint;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                size: 16,
                Icons.search,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedTextKit(
              animatedTexts: [
                for (int i = 0; i < searchHint.length; i++)
                  TyperAnimatedText(
                    searchHint[i],
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    speed: const Duration(milliseconds: 100),
                  ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
