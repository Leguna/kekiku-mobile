import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
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
        color: Colors.grey[500],
        width: double.infinity,
        height: 160,
      ),
    );
  }
}
