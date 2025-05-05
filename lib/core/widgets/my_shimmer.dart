import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    super.key,
    this.radius = 10,
    this.width = double.infinity,
    this.height = 16,
    this.padding,
  });

  final double radius;
  final double width;
  final double height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer(
        gradient: LinearGradient(
          colors: [
            Colors.grey[600]!,
            Colors.grey[500]!,
            Colors.grey[600]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.grey[500],
          ),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
