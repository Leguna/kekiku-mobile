import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FakeSearchBar extends StatelessWidget {
  const FakeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
              TyperAnimatedText(
                'Search for products',
                textStyle: Theme.of(context).textTheme.bodySmall,
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
