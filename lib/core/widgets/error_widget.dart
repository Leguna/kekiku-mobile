import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    this.color,
    this.minHeight,
    this.minWidth,
  });

  final Color? color;
  final double? minHeight;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight ?? 100,
        minWidth: minWidth ?? double.infinity,
      ),
      color: Colors.grey,
      child: const Icon(Icons.error_outline),
    );
  }
}
