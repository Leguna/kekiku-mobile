import 'dart:ui';

import 'package:flutter/material.dart';

import 'timer_fill_indicator.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    super.key,
    required this.controller,
    required this.itemCount,
    this.color = Colors.white,
    this.onPageSelected,
    this.duration = const Duration(seconds: 5),
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final Color color;
  final ValueChanged<int>? onPageSelected;
  final Duration duration;

  double get offset => controller.page ?? controller.initialPage.toDouble();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        double selectedLerp = (1.0 - ((offset - index).abs().clamp(0.0, 1.0)));
        double size = lerpDouble(8.0, 32.0, selectedLerp) ?? 8.0;
        Color dotColor = Color.lerp(Colors.grey, color, selectedLerp)!;
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TimerFillIndicator(
            duration: duration,
            color: dotColor,
            backgroundColor: Colors.grey,
            height: 8.0,
            width: size,
            fillPercentage: selectedLerp,
            onSelected: () {
              onPageSelected?.call(index);
            },
          ),
        );
      }),
    );
  }
}
